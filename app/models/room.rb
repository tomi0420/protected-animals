class Room < ApplicationRecord

  belongs_to :user
  belongs_to :conservation_group
  belongs_to :animal
  has_many :chats,dependent: :destroy

  validates :name, presence: true

end
