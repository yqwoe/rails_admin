class V1::SessionsController < ApplicationController
  before_action :set_session ,only: [:destroy]

  def create
    @user = User.find_by_username(session_params[:username])
    if @user.blank?
      api_render({:message =>'用户不存在',:status => 401})
    elsif @user.password != session_params[:password]
      api_render({:message => '用户密码错误',:status => 401})
    else
      @user.reset_auth_token!
      success({:message => '登录成功',:status => 200,:user => @user.reload.as_json(:except => [:password_digest])})
    end
  end

  def destroy
    if @user.reset_auth_token!
      api_render({:message =>'注销成功',:status => 200})
    else
      error({:message =>'注销失败',:status => 500})
    end
  end

  private
  def session_params
    params.require(:session).permit(:username,:password)
  end
  def set_session
    @user=User.find_by_id(params[:id])
  end
end
