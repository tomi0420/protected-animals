class Animal < ApplicationRecord

  has_many :animal_tags
  has_many :tags, through: :animal_tags

end
