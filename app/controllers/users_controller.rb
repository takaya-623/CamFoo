class UsersController < ApplicationController
  # before_action :confirm_user, only: [:edit, :update]

  # def confirm_user
  #   user = User.find(params[:id])
  #   unless user == current_user
  #     redirect_to user_path(current_user)
  #   end
  # end

  def show
    @user = User.find(params[:id])
    @cooks = current_user.cooks
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
    params.require(:user).permit(:acount, :account_image)
  end
end

