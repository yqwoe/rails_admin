class ApplicationController < ActionController::API
  include CanCan::Ability
  include CanCan::ControllerAdditions
  before_action :authenticate_user! ,if: :user_sigin_in?
  before_action :resource_can! ,if: :user_sigin_in?
  attr_accessor :current_user,
                :page,
                :page_size,
                :total
  # 无权限返回信息
  # HTTP Status 403
  #
  #     { error: 'AccessDenied', message: '原因' }
  class AccessDenied < StandardError; end

  rescue_from(AccessDenied) do |err|
    error(message: err,status:403)
  end

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

  def page
    @page ||= params[:page]
  end
  def page_size
    @page_size ||= params[:pageSize]
  end
  def user_sigin_in?
    /[^sessions]/ =~ controller_name
  end

  def api_render(opts = {})
    render :json=>opts, status: opts[:status]
  end

  def success(opts = {})
    api_render({:message => '成功'|| opts[:message], :status => 200}.merge!(opts))
  end

  def error(opts = {})
    api_render({:message => '失败'|| opts[:message], :status => 422}.merge!(opts))
  end

  def unauthenticated!
    api_render({:message=>'未授权',status: 401})
  end

  def resource_can!
    alias_action :index, :show, :to => :read
    alias_action :create, :new, :to => :create
    alias_action :update, :edit, :to => :update
    _,permission=aliases_for_action(action_name.to_sym)
    resource=controller_path.gsub(/v1/,"")

    if !can?(permission,resource)
      raise AccessDenied,'没有权限访问'
    end
  end

end
