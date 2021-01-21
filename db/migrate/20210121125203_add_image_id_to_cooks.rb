class AddImageIdToCooks < ActiveRecord::Migration[5.2]
  def change
    add_column :cooks, :image_id, :string
  end
end
