class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.integer      :animal_category_id,        null: false
      t.integer      :animal_type_id,            null: false
      t.integer      :sex_id,                    null: false
      t.integer      :prefecture_id,             null: false
      t.timestamps
    end
  end
end
