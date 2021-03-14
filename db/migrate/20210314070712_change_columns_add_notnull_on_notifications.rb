class ChangeColumnsAddNotnullOnNotifications < ActiveRecord::Migration[5.2]
  def change
    change_column :notifications, :visitor_id, :integer, null: false
    change_column :notifications, :visited_id, :integer, null: false
    change_column :notifications, :cook_id, :integer, null: false
    change_column :notifications, :action, :string, null: false
  end
end
