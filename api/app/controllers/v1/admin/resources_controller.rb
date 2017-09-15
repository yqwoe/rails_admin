class V1::Admin::ResourcesController < ApplicationController
  def index
    @resources=Resource.order("parent_id desc").page(page).per(page_size)
    @hash_tree = Resource.actived.arrange_serializable
    @permissions = current_ability.permissions
  end
end
