# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Cookモデルのテスト', type: :model do
  describe "バリデーションテスト" do
    it "全ての項目がないと登録できない" do
      expect(FactoryBot.create(:cook)).to be_valid
    end

    it "名前がなければ登録できない" do
      expect(FactoryBot.build(:cook, name: "")).to be_invalid
    end

    it "特徴がなければ登録できない" do
      expect(FactoryBot.build(:cook, comment: "")).to be_invalid
    end

    it "ジャンルがなければ登録できない" do
      expect(FactoryBot.build(:cook, cook_genre: "")).to be_invalid
    end

    it "調理道具がなければ登録できない" do
      expect(FactoryBot.build(:cook, cook_item: "")).to be_invalid
    end

    it "調理時間がなければ登録できない" do
      expect(FactoryBot.build(:cook, cooking_time: "")).to be_invalid
    end

    it "調理方法がなければ登録できない" do
      expect(FactoryBot.build(:cook, cooking_method: "")).to be_invalid
    end

    it "画像がなければ登録できない" do
      expect(FactoryBot.build(:cook, image: "")).to be_invalid
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Cook.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'Likeモデルとの関係' do
      it '1:Nとなっている' do
        expect(Cook.reflect_on_association(:likes).macro).to eq :has_many
      end
    end

    context 'Bookmarksモデルとの関係' do
      it '1:Nとなっている' do
        expect(Cook.reflect_on_association(:bookmarks).macro).to eq :has_many
      end
    end

    context 'Notificationsモデルとの関係' do
      it '1:Nとなっている' do
        expect(Cook.reflect_on_association(:notifications).macro).to eq :has_many
      end
    end
  end
end
