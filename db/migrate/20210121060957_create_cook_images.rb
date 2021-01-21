class CreateCookImages < ActiveRecord::Migration[5.2]
  def change
    create_table :cook_images do |t|
      t.integer :cook_id, null: false
      t.string :image_id

      t.timestamps
    end
  end
end
