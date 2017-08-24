class V1::SessionsController < ApplicationController
  def show
  end

  def create
    @user = User.find_by_username(session_params[:username])
    if @user.blank?
      api_render({:message =>'用户不存在',:status => 401})
    elsif @user.password != session_params[:password]
      api_render({:message => '用户密码错误',:status => 401})
    elsif @user.state == 2
      api_render({:message => '用户已被禁用',:status => 401})
    else
      @user.reset_auth_token!
      api_success({:message => '登录成功',:status => 200,:user => @user.reload.as_json(:except => [:password_digest])})
    end
  end

  private
  def session_params
    params.require(:session).permit(User.attribute_names)
  end
end
