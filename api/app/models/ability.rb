class Ability
  include CanCan::Ability

  attr_reader :user

  def initialize(user)
    @user= user
    if @user.has_role?(:super_admin)
      can :manage,:all
    else
      roles_for_resources
    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end

  protected

  def roles_for_resources
    resources=RoleResource.includes(:resource).where(:role_id => @user.role_ids)
    resources.each do |resource|
     action =  resource.actions ? resource.actions.map(&:to_sym) : [:read]
      can action, resource.resource.url if resource.resource.url
    end
  end
end
