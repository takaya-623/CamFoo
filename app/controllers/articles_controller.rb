class ArticlesController < ApplicationController
  def index
    @articles = Article.page(params[:page]).per(10).order(updated_at: :desc)
  end

  def show
    @article = Article.find(params[:id])
  end
end
