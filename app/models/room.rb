class Room < ApplicationRecord

  belongs_to :user
  belongs_to :conservation_group
  has_many :chats,dependent: :destroy

end
