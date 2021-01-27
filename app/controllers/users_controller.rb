class UsersController < ApplicationController
  before_action :confirm_user, only: [:edit, :update]

  def dummy
    redirect_to new_user_registration_path
  end


  def confirm_user
    user = User.find(params[:id])
    unless user == current_user
      redirect_to user_path(current_user)
    end
  end

  def show
    @user = User.find(params[:id])
    @cooks = @user.cooks.sorted
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def user_params
    params.require(:user).permit(:account, :account_image)
  end
end

