class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  
  def item_params
    params.require(:item).permit(:item_name, :category_id, :status_id, :price, :text, :shipping_date_id, :prefecture_id, :delivery_fee_id, :user_id, :image)
  end
end
