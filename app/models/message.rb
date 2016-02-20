class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :content, :user, :room, presence: true
end
