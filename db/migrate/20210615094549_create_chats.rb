class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.string     :content
      t.references :room,                   foreign_key: true
      t.references :user,                   foreign_key: true
      t.references :conservation_group,     foreign_key: true
      t.timestamps
    end
  end
end
