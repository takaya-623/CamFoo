# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe "バリデーションテスト" do
    it "性・名、セイ・メイ、メールアドレス、アカウント、パスワードがあれば登録できる" do
      expect(FactoryBot.create(:user)).to be_valid
    end

    it "性がなければ登録できない" do
      expect(FactoryBot.build(:user, last_name: "")).to be_invalid
    end

    it "名がなければ登録できない" do
      expect(FactoryBot.build(:user, first_name: "")).to be_invalid
    end

    it "セイがなければ登録できない" do
      expect(FactoryBot.build(:user, last_name_kana: "")).to be_invalid
    end

    it "メイがなければ登録できない" do
      expect(FactoryBot.build(:user, first_name_kana: "")).to be_invalid
    end

    it "メールアドレスがなければ登録できない" do
      expect(FactoryBot.build(:user, email: "")).to be_invalid
    end

    context "アカウントに関するテスト" do
      it "アカウントがなければ登録できない" do
        expect(FactoryBot.build(:user, email: "")).to be_invalid
      end

      it "アカウントは5文字以下だと登録できない" do
        user = User.new(account: "a" * 4)
        expect(user).to be_invalid
      end

      it "アカウントは15文字以上だと登録できない" do
        user = User.new(account: "a" * 16)
        expect(user).to be_invalid
      end
    end

    it "パスワードがなければ登録できない" do
      expect(FactoryBot.build(:user, password: "")).to be_invalid
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Cookモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:cooks).macro).to eq :has_many
      end
    end
    context 'Likeモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:likes).macro).to eq :has_many
      end
    end
    context 'Bookmarksモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:bookmarks).macro).to eq :has_many
      end
    end
    context 'Notifications(active)モデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:active_notifications).macro).to eq :has_many
      end
    end
    context 'Notifications(passive)モデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:passive_notifications).macro).to eq :has_many
      end
    end
  end
end