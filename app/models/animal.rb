class Animal < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :animal_category
  belongs_to :size
  belongs_to :sex
  belongs_to :prefecture

  has_many :animal_tags
  has_many :tags, through: :animal_tags
  has_one_attached :image

end
