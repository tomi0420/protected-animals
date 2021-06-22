class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string     :name,               null: false,    default: ""
      t.references :user,               null: false,    foreign_key: true
      t.references :conservation_group, null: false,    foreign_key: true
      t.references :animal,             null: false,    foreign_key: true
      t.timestamps
    end
  end
end
