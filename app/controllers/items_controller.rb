class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:item_name, :category_id, :status_id, :price, :text, :shipping_date_id, :prefecture_id, :delivery_fee_id, :user_id, :image).merge(user_id: current_user.id)
  end
end
