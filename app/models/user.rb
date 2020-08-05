class User < ApplicationRecord
  has_secure_token :api_key

  validates_presence_of :email

  validates :email, uniqueness: true, presence: true

  validates_confirmation_of :password, :message => "Passwords should match"

  has_secure_password
end
