class Role < ApplicationRecord
  include Searchable
  has_many :user_roles
  has_many :users,through: :user_roles
  has_many :role_resources
  has_many :resources,through: :role_resources
end
