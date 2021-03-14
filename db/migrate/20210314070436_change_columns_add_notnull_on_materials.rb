class ChangeColumnsAddNotnullOnMaterials < ActiveRecord::Migration[5.2]
  def change
    change_column :materials, :cook_id, :integer, null: false
  end
end
