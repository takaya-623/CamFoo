require 'rails_helper'

describe "ユーザーログイン後のテスト" do
  let(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:cook) { create(:cook, user: user) }
  let!(:other_cook) { create(:cook, user: other_user) }

  before do
    visit new_user_session_path
    fill_in "user[email]", with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログインする'
  end

  describe "料理一覧画面のテスト" do
    before do
      visit cooks_path
    end

    context "表示内容の確認" do
      it "URLが正しい" do
        expect(current_path).to eq '/cooks'
      end
      it '自分と他人の画像のリンク先が正しい' do
        expect(page).to have_link '', href: user_path(cook.user)
        expect(page).to have_link '', href: user_path(other_cook.user)
      end
      it '自分の投稿と他人の投稿の詳細リンク先がそれぞれ正しい' do
        expect(page).to have_link '', href: cook_path(cook)
        expect(page).to have_link '', href: cook_path(other_cook)
      end
    end

    context '投稿成功のテスト' do
      before do
        visit new_cook_path
        fill_in 'cook[name]', with: Faker::Lorem.characters(number: 5)
        fill_in 'cook[comment]', with: Faker::Lorem.characters(number: 20)
        fill_in 'cook[cooking_time]', with: 20
        select "肉", from: "cook[cook_genre]"
        select "網", from: 'cook[cook_item]'
        fill_in 'cook[cooking_method]', with: Faker::Lorem.characters(number: 20)
        attach_file 'cook[image]', "#{Rails.root}/app/assets/images/test.jpg"
      end

      it '自分の新しい投稿が正しく保存される' do
        expect { click_button '投稿する' }.to change(user.cooks, :count).by(1)
      end
      it 'リダイレクト先が、保存できた投稿の詳細画面になっている' do
        click_button '投稿する'
        expect(current_path).to eq '/users/' + User.last.id.to_s
      end
    end
  end

  describe "自分の料理詳細画面のテスト" do
    before do
      visit cook_path(cook)
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/cooks/' + cook.id.to_s
      end
      it 'nameが表示される' do
        expect(page).to have_content cook.name
      end
      it 'commentが表示される' do
        expect(page).to have_content cook.comment
      end
      it 'cook_genreが表示される' do
        expect(page).to have_content cook.cook_genre_i18n
      end
      it 'cook_itemが表示される' do
        expect(page).to have_content cook.cook_item_i18n
      end
      it '投稿の編集リンクが表示される' do
        expect(page).to have_link '編集する', href: edit_cook_path(cook)
      end
      it '投稿の削除リンクが表示される' do
        expect(page).to have_link '削除する', href: cook_path(cook)
      end
    end
  end

  describe "他人の料理詳細画面のテスト" do
    context "表示内容の確認" do
      before do
        visit visit cook_path(other_cook)
      end

      it "編集リンクが表示されない" do
        expect(page).not_to have_link '編集する', href: edit_cook_path(other_cook)
      end
      it "削除リンクが表示されない" do
        expect(page).not_to have_link '削除する', href: cook_path(other_cook)
      end
    end
  end

  describe "自分のユーザー詳細画面のテスト" do
    context "表示内容の確認" do
      before do
        visit user_path(user)
      end

      it "account名が表示される" do
        expect(page).to have_content user.account
      end
      it "フルネームが表示される" do
        expect(page).to have_content user.fullname
      end
      it "emailが表示される" do
        expect(page).to have_content user.email
      end
      it "編集リンクが表示される" do
        expect(page).to have_link "編集", href: edit_user_path(user)
      end
      it "退会リンクが表示される" do
        expect(page).to have_link "退会", href: user_path(user)
      end
    end
  end

  describe "他人のユーザー詳細画面のテスト" do
    context "表示内容の確認" do
      before do
        visit user_path(other_user)
      end

      it "account名が表示される" do
        expect(page).to have_content other_user.account
      end
      it "フルネームが表示されない" do
        expect(page).not_to have_content other_user.fullname
      end
      it "emailが表示されない" do
        expect(page).not_to have_content other_user.email
      end
      it "編集リンクが表示されない" do
        expect(page).not_to have_link "編集", href: edit_user_path(other_user)
      end
      it "退会リンクが表示されない" do
        expect(page).not_to have_link "退会", href: user_path(other_user)
      end
    end
  end

  describe '自分のユーザ情報編集画面のテスト' do
    before do
      visit edit_user_path(user)
    end

    context '表示の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/' + user.id.to_s + '/edit'
      end
      it 'アカウント編集フォームに自分の名前が表示される' do
        expect(page).to have_field 'user[account]', with: user.account
      end
      it 'プロフィール画像編集フォームが表示される' do
        expect(page).to have_field 'user[account_image]'
      end
      it '変更ボタンが表示される' do
        expect(page).to have_button '変更する'
      end
    end

    context '更新成功のテスト' do
      before do
        @user_old_account = user.account
        @user_old_account_image = user.account_image
        fill_in 'user[account]', with: Faker::Lorem.characters(number: 5)
        attach_file 'user[account_image]', "#{Rails.root}/app/assets/images/test.jpg"
        click_button '変更する'
      end

      it 'accountが正しく更新される' do
        expect(user.reload.account).not_to eq @user_old_account
      end
      it 'account_imageが正しく更新される' do
        expect(user.reload.account_image).not_to eq @user_old_account_image
      end
      it 'リダイレクト先が、自分のユーザ詳細画面になっている' do
        expect(current_path).to eq '/users/' + user.id.to_s
      end
    end
  end
end
