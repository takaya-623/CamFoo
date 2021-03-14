class ChangeColumnsAddNotnullOnCooks < ActiveRecord::Migration[5.2]
  def change
    change_column :cooks, :image_id, :string, null: false
    change_column :cooks, :comment, :string, null: false
  end
end
