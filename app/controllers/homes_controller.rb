class HomesController < ApplicationController
  def top
    @ranks = Cook.ranks_top
    @articles = Article.all.limit(3).order(updated_at: :desc)
  end
end
