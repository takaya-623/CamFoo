class CooksController < ApplicationController
  before_action :confirm_user, only: [:edit, :update, :destroy]

  def confirm_user
    cook = Cook.find(params[:id])
    unless cook.user_id == current_user.id
      redirect_to root_path
    end
  end

  def new
    @cook = Cook.new
    8.times { @cook.materials.build }
  end

  def create
    @cook = Cook.new(cook_params)
    @cook.user_id = current_user.id
    if @cook.save
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  def index
    @cooks = Cook.page(params[:page]).per(9).order(updated_at: :desc)
  end

  def net
    @cooks_net = Cook.page(params[:page]).where(cook_item: 0).per(9).order(updated_at: :desc)
  end

  def plate
    @cooks_plate = Cook.page(params[:page]).where(cook_item: 1).per(9).order(updated_at: :desc)
  end

  def pan
    @cooks_pan = Cook.page(params[:page]).where(cook_item: 2).per(9).order(updated_at: :desc)
  end

  def dutch_oven
    @cooks_dutch_oven = Cook.page(params[:page]).where(cook_item: 3).per(9).order(updated_at: :desc)
  end

  def other
    @cooks_other = Cook.page(params[:page]).where(cook_item: 4).per(9).order(updated_at: :desc)
  end

  def rank
    @ranks = Cook.ranks #モデルに定義記載
  end

  def show
    @cook = Cook.find(params[:id])
    # 値が入っているものだけを取り出している
    @materials = @cook.materials.where.not(material: "")
  end

  def edit
    @cook = Cook.find(params[:id])
  end

  def update
    @cook = Cook.find(params[:id])
    if @cook.update(cook_params)
      redirect_to cook_path(@cook)
    else
      render 'edit'
    end
  end

  def destroy
    @cook = Cook.find(params[:id])
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
      :image,
      :comment,
      materials_attributes: [:material, :qty, :id]
    )
  end
end
