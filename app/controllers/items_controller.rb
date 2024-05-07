class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new#入力ページ
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :item_condition_id, :shipping_charge_id, :prefecture_id, :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  end
end


