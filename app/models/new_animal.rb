class NewAnimal
  include ActiveModel::Model
  attr_accessor :name, :age, :birth_date, :info, :personality, :animal_category_id, :animal_type_id, :sex_id, :prefecture_id, :user_id

  with_options presence: true do
    validates :name
    validates :age, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 30 }
    validates :birth_date
    validates :info
    validates :personality
    validates :user_id
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :animal_category_id
    validates :animal_type_id
    validates :sex_id
    validates :prefecture_id
  end

  def save
   Animal.create(name: name, age: age, birth_date: birth_date, info: info, personality: personality, user_id: user_id )
   Tags.create(animal_category_id: animal_category_id, animal_type_id: animal_type_id, sex_id: sex_id, prefecture_id: prefecture_id )
  end

end