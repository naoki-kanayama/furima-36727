class RecordsController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
    @record_destination = RecordDestination.new
  end

  def create
    @item = Item.find(params[:item_id])
    @record_destination = RecordDestination.new(record_params)
    if @record_destination.valid?
      pay_item
      @record_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def record_params
    @item = Item.find(params[:item_id])
    params.require(:record_destination).permit(:city, :prefecture_id, :address, :building_number, :address_number, :tel_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: record_params[:token],
      currency: 'jpy'
    )
  end

end

