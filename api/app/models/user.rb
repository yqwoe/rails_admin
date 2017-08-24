class User < ApplicationRecord
  include Searchable
  include BCrypt
  has_secure_password
  before_create :generate_authentication_token
  has_many :group_users
  has_many :groups ,through: :group_users
  has_many :user_roles
  has_many :roles,through: :user_roles





  def generate_authentication_token
    loop do
      self.authentication_token = SecureRandom.base64(64)
      break if !User.find_by(authentication_token: authentication_token)
    end
  end
  def reset_auth_token!
    generate_authentication_token
    save
  end
  def password
    @password ||= Password.new(password_digest)
  end
end
