class Resource < ApplicationRecord
  include Searchable
  has_ancestry
  has_many :role_resources
  has_many :roles,through: :role_resources

  #查询菜单 0文件夹 1菜单  2api
  scope :actived,->{
    where("menu_id != 2")
  }
end
