class Resource < ApplicationRecord
  include Searchable
  has_many :role_resources
  has_many :roles,through: :role_resources
end
