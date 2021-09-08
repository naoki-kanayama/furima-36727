class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :sold_out, only: [:edit, :update, :destroy]
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit 
    @item = Item.find(params[:id])
    if current_user.id != @item.user_id
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      redirect_to root_path
    end
    if current_user != @item.user_id
      redirect_to root_path
    end
  end



  private
  
  def item_params
    params.require(:item).permit(:item_name, :category_id, :status_id, :price, :text, :shipping_date_id, :prefecture_id, :delivery_fee_id, :image).merge(user_id: current_user.id)
  end

  def sold_out
    @item = Item.find(params[:id])
    if @item.record.present?
      redirect_to root_path
    end
  end
end
