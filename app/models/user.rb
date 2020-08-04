class User < ApplicationRecord
  validates_presence_of :email, :api_key
end
