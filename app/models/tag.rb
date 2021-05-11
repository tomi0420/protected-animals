class Tag < ApplicationRecord

  has_many :animal_tags
  has_many :animals, through: :animal_tags

end
