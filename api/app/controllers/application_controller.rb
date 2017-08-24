class ApplicationController < ActionController::API
  before_action :authenticate_user! ,if: :user_sigin_in?
  attr_accessor :current_user,
                :page,
                :page_size,
                :total

  def authenticate_user!
    token, options = ActionController::HttpAuthentication::Token.token_and_options(request)
    user = token && User.find_by(authentication_token: token)
    if user && #根据token查询user是否存在
        ActiveSupport::SecurityUtils.secure_compare(user.authentication_token, token) #验证token是否匹配
      self.current_user = user
    else
      return unauthenticated!
    end
  end

  def user_sigin_in?
    /[^sessions]/ =~ controller_name
  end

  def api_render(opts = {})
    render :json=>opts, status: opts[:status]
  end

  def api_success(opts = {})
    api_render({:message => '成功'|| opts[:message], :status => 200}.merge(opts))
  end

  def api_error(opts = {})
    api_render({:message => '失败'|| opts[:message], :status => 422}.merge(opts))
  end

  def unauthenticated!
    api_render({:message=>'未授权',status: 401})
  end

end
