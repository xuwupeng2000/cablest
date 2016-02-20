class User < ApplicationRecord
  has_many :rooms
  has_many :messages
  validates :email, :name, presence: true

  has_secure_password
end
