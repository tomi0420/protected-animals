class Chat < ApplicationRecord

  belongs_to :user,                 optional: true
  belongs_to :conservation_group,   optional: true
  
  validates :content,               presence: true
end

