class NewAnimal
  include ActiveModel::Model
  include ActiveRecord::AttributeAssignment
  attr_accessor :image, :name, :age, :birth_date, :personality, :animal_category_id, :size_id, :kind_name, :sex_id, :prefecture_id

  with_options presence: true do
    validates :image
    validates :name
    validates :animal_category_id
    validates :kind_name
    validates :size_id
    validates :sex_id
    validates :age, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 30 }
    validates :birth_date
    validates :personality
    validates :prefecture_id, numericality: { other_than: 1 }
  end

  def save
   animal = Animal.create( image: image, name: name, age: age, birth_date: birth_date, personality: personality, animal_category_id: animal_category_id, size_id: size_id, sex_id: sex_id, prefecture_id: prefecture_id )
   tag = Tag.where( kind_name: kind_name ).first_or_initialize
   tag.save

   AnimalTag.create( animal_id: animal.id, tag_id: tag.id )
  end

end