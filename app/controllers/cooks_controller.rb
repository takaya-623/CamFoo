class CooksController < ApplicationController
  # before_action :confirm_user, only: [:edit, :update, :destroy]

  # def confirm_user
  #   user = User.find(params[:id])
  #   unless user == current_user
  #     redirect_to user_path(current_user)
  #   end
  # end

  def new
    @cook = Cook.new
    @cook.cook_images.build
  end

  def create
    @cook = Cook.new(cook_params)
    @cook.user_id = current_user.id
    @cook.save
    redirect_to user_path(current_user)
  end

  def index
  end

  def net
  end

  def plate
  end

  def pan
  end

  def dutch_oven
  end

  def other
  end

  def show
    @cook = Cook.find(params[:id])
    @cook.user_id = current_user.id
  end

  def edit
    @cook = Cook.find(params[:id])
    @cook.user_id = current_user.id
  end

  def update
    @cook = Cook.find(params[:id])
    @cook.user_id = current_user.id
    @cook.update(cook_params)
    redirect_to user_path(current_user)
  end

  def destroy
    @cook = Cook.find(params[:id])
    @cook.user_id = current_user.id
    @cook.destroy
    redirect_to user_path(current_user)
  end


  private

  def cook_params
    params.require(:cook).permit(
      :name,
      :cooking_time,
      :cook_genre,
      :cook_item,
      :cooking_method,
      cook_images_images: []
    )
  end
end
