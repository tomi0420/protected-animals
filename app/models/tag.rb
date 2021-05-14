class Tag < ApplicationRecord

  has_many :animal_tags
  has_many :animals, through: :animal_tags

  validates :kind_name,         uniqueness: true

end
