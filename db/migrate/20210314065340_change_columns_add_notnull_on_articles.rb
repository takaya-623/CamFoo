class ChangeColumnsAddNotnullOnArticles < ActiveRecord::Migration[5.2]
  def change
    change_column :articles, :article_image, :string, null: false
    change_column :articles, :topic, :integer, null: false
  end
end
