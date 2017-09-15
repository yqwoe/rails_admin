class Role < ApplicationRecord
  has_many :user_roles
  has_many :users,through: :user_roles
  has_many :role_resources
  has_many :resources,through: :role_resources
  # belongs_to :resource,
  #            :polymorphic => true,
  #            :optional => true
  #
  # validates :resource_type,
  #           :inclusion => { :in => Rolify.resource_types },
  #           :allow_nil => true

  # scopify
end
