ActiveAdmin.register User do

  permit_params  :first_name, :last_name, :email, :account_image_id

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
      row :fullname
      row :email
      row :account
      end
  end
end
