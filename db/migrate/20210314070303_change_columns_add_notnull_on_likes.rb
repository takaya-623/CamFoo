class ChangeColumnsAddNotnullOnLikes < ActiveRecord::Migration[5.2]
  def change
    change_column :likes, :user_id, :integer, null: false
    change_column :likes, :cook_id, :integer, null: false
  end
end
