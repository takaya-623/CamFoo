ActiveAdmin.register Cook do

  permit_params :user_id, :name, :cooking_time, :cook_genre, :cook_item, :cooking_method, :image_id, :comment

  filter :id
  filter :name
  filter :cooking_time
  filter :cook_genre, as: :select, collection:Cook.cook_genres_i18n.invert
  filter :cook_item, as: :select, collection:Cook.cook_items_i18n.invert
  filter :created_at
  filter :updated_at

  index :title => "料理一覧" do
    selectable_column
    id_column
    column :name
    column :cooking_time
    column :cook_genre do |cook|
      cook.cook_genre_i18n
    end
    column :cook_item do |cook|
      cook.cook_item_i18n
    end
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :name
      row :comment
      row :cooking_time
      row :cook_genre do |cook|
        cook.cook_genre_i18n
      end
      row :cook_item do |cook|
        cook.cook_item_i18n
      end
      row :cooking_method
    end
  end

  # form do |f|
  #   f.inputs "cooks" do
  #     f.input :name
  #     f.input :cooking_time
  #     f.input :cook_genre, as: :select, collection:Cook.cook_genres_i18n.invert
  #     f.input :cook_item, as: :select, collection:Cook.cook_items_i18n.invert
  #     f.input :cooking_method
  #     f.input :image_id, :as => :file
  #   end
  #   f.actions
  # end


end
