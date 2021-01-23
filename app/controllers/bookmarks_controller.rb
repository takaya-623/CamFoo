class BookmarksController < ApplicationController
  def create
    @cook = Cook.find(params[:cook_id])
    bookmark = current_user.bookmarks.new(cook_id: @cook.id)
    bookmark.save
    # redirect_to cook_path(cook)
  end

  def destroy
    @cook = Cook.find(params[:cook_id])
    bookmark = current_user.bookmarks.find_by(cook_id: @cook.id)
    bookmark.destroy
    # redirect_to cook_path(cook)
  end
end
