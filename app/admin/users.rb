ActiveAdmin.register User do
  permit_params :first_name, :last_name, :email, :account_image_id
  actions :all, except: [:new]

  filter :id
  filter :last_name
  filter :first_name
  filter :last_name_kana
  filter :first_name_kana
  filter :email
  filter :account
  filter :created_at
  filter :updated_at

  index :title => "会員一覧" do
    selectable_column
    id_column
    column :last_name
    column :first_name
    column :last_name_kana
    column :first_name_kana
    column :email
    column :account
    column :created_at
    column :updated_at
    actions
  end

  show :title => :fullname do
    attributes_table do
      row :last_name
      row :first_name
      row :email
      row :account
    end
    panel "投稿一覧" do
      table_for user.cooks do
        column :name
        column :created_at
        column :updated_at
      end
    end
  end
end
