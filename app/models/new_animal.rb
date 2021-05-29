class NewAnimal
  include ActiveModel::Model
  include ActiveRecord::AttributeAssignment
  attr_accessor :images, :name, :age, :birth_date, :personality, :animal_category_id, :size_id, :kind_name, :sex_id, :prefecture_id

  with_options presence: true do
    validates :images
    validates :name
    validates :kind_name
    validates :age, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 30 }
    validates :birth_date
    validates :personality
  end

  def save
   animal = Animal.create( images: images, name: name, age: age, birth_date: birth_date, personality: personality, animal_category_id: animal_category_id, size_id: size_id, sex_id: sex_id, prefecture_id: prefecture_id )
   tag = Tag.where( kind_name: kind_name ).first_or_initialize
   tag.save

   AnimalTag.create( animal_id: animal.id, tag_id: tag.id )
  end

end