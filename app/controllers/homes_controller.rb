class HomesController < ApplicationController
  def top
    @ranks = Cook.ranks_top
    @articles = Article.all.limit(3).order(updated_at: :desc)
  end

  def new_guest
    user = User.find_or_create_by!(
      last_name: 'ゲスト',
      first_name: 'ログイン',
      last_name_kana: 'ゲスト',
      first_name_kana: 'ログイン',
      email: 'guest@example.com',
      account: '@gest',
      role: 1
    ) do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to root_path, flash: { gest: 'ゲストユーザーとしてログインしました' }
  end
end
