class LikesController < ApplicationController
  def create
    @cook = Cook.find(params[:cook_id])
    like = current_user.likes.new(cook_id: @cook.id)
    like.save
    # redirect_to cook_path(cook)
  end

  def destroy
    @cook = Cook.find(params[:cook_id])
    like = current_user.likes.find_by(cook_id: @cook.id)
    like.destroy
    # redirect_to cook_path(cook)
  end
end
