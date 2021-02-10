require 'rails_helper'

describe "未ログイン状態のテスト" do
  describe "トップ画面のテスト" do
    before do
      visit root_path
    end

    context "ログイン、登録、ゲストログインのリンク確認" do
      it "ログインページのリンクがあるか" do
        expect(page).to have_link "", href: new_user_session_path
      end
      it "登録のリンクがあるか" do
        expect(page).to have_link "", href: new_user_registration_path
      end
      it "ゲストログインのリンクがあるか" do
        expect(page).to have_link "", href: homes_guest_sign_in_path
      end
    end

    context "ログイン、登録、ゲストログインのページ遷移の確認" do
      it "ログインを押すとログインページに遷移する" do
        login_link = find_all('a')[9].native.inner_text
        click_link login_link
        expect(page).to have_current_path new_user_session_path
      end
      it "登録を押すと登録ページに遷移する" do
        signin_link = find_all('a')[10].native.inner_text
        click_link signin_link
        expect(page).to have_current_path new_user_registration_path
      end
      it "ゲストログインを押すとログイン出来る" do
        gest_link = find_all('a')[11].native.inner_text
        click_link gest_link
        expect(page).to have_current_path root_path
        text = find('h2')
        expect(text).to have_content "あなたの「キャンプめし」共有しませんか。"
      end
    end

    context "メイン画面の表示確認" do
      it "Aboutコンテントがある" do
        expect(page).to have_content "About"
      end
      it "Featuresコンテントがある" do
        expect(page).to have_content "Features"
      end
      it "Rankingコンテントがある" do
        expect(page).to have_content "Ranking"
      end
      it "Newコンテントがある" do
        expect(page).to have_content "New"
      end
    end
  end

  describe 'ユーザ新規登録のテスト' do
    before do
      visit new_user_registration_path
    end

    context "表示内容を確認" do
      it "URLが正しい" do
        expect(current_path).to eq '/users/sign_up'
      end
      it "「性」フォームが表示される" do
        expect(page).to have_field 'user[last_name]'
      end
      it "「名」フォームが表示される" do
        expect(page).to have_field 'user[first_name]'
      end
      it "「セイ」フォームが表示される" do
        expect(page).to have_field 'user[last_name_kana]'
      end
      it "「メイ」フォームが表示される" do
        expect(page).to have_field 'user[first_name_kana]'
      end
      it "「メールアドレス」フォームが表示される" do
        expect(page).to have_field 'user[email]'
      end
      it "「アカウント名」フォームが表示される" do
        expect(page).to have_field 'user[account]'
      end
      it "「パスワード」フォームが表示される" do
        expect(page).to have_field 'user[password]'
      end
      it "「パスワード確認」フォームが表示される" do
        expect(page).to have_field 'user[password_confirmation]'
      end
      it '登録ボタンが表示される' do
        expect(page).to have_button '登録する'
      end
    end

    context "新規登録成功のテスト" do
      before do
        fill_in "user[last_name]", with: "山田"
        fill_in "user[first_name]", with: "太郎"
        fill_in "user[last_name_kana]", with: "ヤマダ"
        fill_in "user[first_name_kana]", with: "タロウ"
        fill_in "user[email]", with: Faker::Internet.email
        fill_in 'user[account]', with: Faker::Lorem.characters(number: 5)
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
      end

      it "正しく新規登録される" do
        expect { click_button "登録する" }.to change(User.all, :count).by(1) # ユーザーが一人増えたことをカウントしてる
      end
      it '新規登録後のリダイレクト先が、マイページになっている' do
        click_button '登録する'
        expect(current_path).to eq '/users/' + User.last.id.to_s
      end
    end
  end

  describe 'ユーザログイン' do
    let(:user) { create(:user) }

    before do
      visit new_user_session_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/sign_in'
      end
      it '「メールアドレス」フォームが表示される' do
        expect(page).to have_field 'user[email]'
      end
      it '「パスワード」フォームが表示される' do
        expect(page).to have_field 'user[password]'
      end
      it 'ログインボタンが表示される' do
        expect(page).to have_button 'ログインする'
      end
    end

    context 'ログイン成功のテスト' do
      before do
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'ログインする'
      end

      it 'ログイン後のリダイレクト先が、自身のマイページになっている' do
        expect(current_path).to eq '/users/' + user.id.to_s
      end
    end

    context 'ログイン失敗のテスト' do
      before do
        fill_in 'user[email]', with: ''
        fill_in 'user[password]', with: ''
        click_button 'ログインする'
      end

      it 'ログインに失敗し、ログイン画面にリダイレクトされる' do
        expect(current_path).to eq '/users/sign_in'
      end
    end
  end

  describe 'ユーザログアウトのテスト' do
    let(:user) { create(:user) }

    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログインする'
      click_link 'ログアウト'
    end

    context 'ログアウト機能のテスト' do
      it '正しくログアウトできている: ログアウト後のリダイレクト先においてログインリンクが存在する' do
        expect(page).to have_link "", href: new_user_session_path
      end
      it 'ログアウト後のリダイレクト先が、トップページである' do
        expect(current_path).to eq '/'
      end
    end
  end
end
