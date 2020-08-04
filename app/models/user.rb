class User < ApplicationRecord
  validates_presence_of :email, :api_key
  
  validates :email, uniqueness: true, presence: true

  validates_confirmation_of :password, :message => "Passwords should match"

  has_secure_password
end
