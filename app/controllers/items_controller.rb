class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  
  def item_params
    params.require(:item).permit(:)
end
