class AddImageIdToCooks < ActiveRecord::Migration[5.2]
  def change
    add_column :cooks, :image_id, :string
    add_column :cooks, :comment, :string
  end
end
