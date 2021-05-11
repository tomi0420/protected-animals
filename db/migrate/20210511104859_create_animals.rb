class CreateAnimals < ActiveRecord::Migration[6.0]
  def change
    create_table :animals do |t|
      t.string       :name,                     null: false
      t.integer      :age,                      null: false
      t.date         :birth_date,               null: false
      t.text         :info,                     null: false
      t.text         :personality,              null: false
      # t.references   :conversation_group,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
