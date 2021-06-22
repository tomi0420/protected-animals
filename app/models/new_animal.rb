class NewAnimal
  include ActiveModel::Model
  include ActiveRecord::AttributeAssignment
  attr_accessor :images, :name, :age, :birth_date, :personality, :animal_category_id, :size_id, :kind_name, :sex_id, :prefecture_id, :conservation_group_id

  with_options presence: true do
    validates :images
    validates :name
    validates :age, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 30 }
    validates :birth_date
    validates :personality
    validates :animal_category_id
    validates :size_id
    validates :kind_name
    validates :sex_id
    validates :prefecture_id
    validates :conservation_group_id
  end

  def save(tag_list)
    animal = Animal.create( images: images, name: name, age: age, birth_date: birth_date, personality: personality, animal_category_id: animal_category_id, size_id: size_id, sex_id: sex_id, prefecture_id: prefecture_id, conservation_group_id: conservation_group_id )

    tag_list.each do |tag_name|
      tag = Tag.where(kind_name: tag_name).first_or_initialize
      tag.save

      AnimalTag.create( animal_id: animal.id, tag_id: tag.id )
    end
  end

end