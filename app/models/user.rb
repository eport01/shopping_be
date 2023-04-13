class User < ApplicationRecord
  validates_presence_of :password, :name 
  validates :email, uniqueness: true, presence: true 
  has_secure_password 
end
