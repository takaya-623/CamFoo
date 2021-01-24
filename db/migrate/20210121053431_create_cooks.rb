class CreateCooks < ActiveRecord::Migration[5.2]
  def change
    create_table :cooks do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.integer :cooking_time, null: false
      t.integer :cook_genre, null: false
      t.integer :cook_item, null: false
      t.text :cooking_method, null: false

      t.timestamps
    end
  end
end
