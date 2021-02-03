ActiveAdmin.register Article do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :body, :article_image, :topic

  filter :id
  filter :title
  filter :topic
  filter :body
  filter :topic, as: :select, collection:Article.topics_i18n.invert
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs "Articles" do
      f.input :title
      f.input :topic, as: :select, collection:Article.topics_i18n.invert
      f.input :body
      f.input :article_image
    end
    f.actions
  end

  index :title => "管理者記事" do
    selectable_column
    id_column
    column :title
    column :topic do |article|
      article.topic_i18n
    end
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :title
      row :topic do |article|
        article.topic_i18n
      end
      row :body
      row :article_image do |image|
         image_tag(image.article_image.url, size: "300x180")
      end
    end
  end
end
