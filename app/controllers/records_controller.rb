class RecordsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @record_destination = RecordDestination.new
  end

  def create
    @record_destination = RecordDestination.new(record_params)
    if @record_destination.valid?
      @record_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def record_params
    @item = Item.find(params[:item_id])
    params.require(:record_destination).permit(:city, :prefecture_id, :address, :building_number, :address_number, :tel_number).merge(user_id: current_user.id, item_id: @item.id)
  end

end

