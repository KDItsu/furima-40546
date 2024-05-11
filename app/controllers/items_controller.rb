class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :new]
  before_action :set_item, only: [:show, :edit, :update]
  def index
    @items = Item.all.includes(:user).order('created_at DESC')
  end

  def new#入力ページ
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def update
     if @item.update(item_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  private

  def set_item
    @item = Item.find(params[:id])
  end


  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :item_condition_id, :shipping_charge_id, :prefecture_id, :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  end
end


