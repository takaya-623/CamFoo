ActiveAdmin.register Article do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :body, :article_image

  form do |f|
    f.inputs "Articles" do
      f.input :title
      f.input :body
      f.input :article_image, :as => :file
    end
    f.actions
  end

  show do |item_image|
    attributes_table do
      row :title
      row :body
      row :article_image do
         image_tag(article.article_image.to_s)
      end
    end
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :body, :article_image]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
