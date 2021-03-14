class ChangeColumnsAddNotnullOnBookmarks < ActiveRecord::Migration[5.2]
  def change
    change_column :bookmarks, :user_id, :integer, null: false
    change_column :bookmarks, :cook_id, :integer, null: false
  end
end
