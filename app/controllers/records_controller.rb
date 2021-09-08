class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :sold_out
  before_action :item_find
  def index
    item_find
    if current_user.id == @item.user_id
      redirect_to root_path
    end
    @record_destination = RecordDestination.new
  end

  def create
    item_find
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
    item_find
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
  def sold_out
    item_find
    if @item.record.present?
      redirect_to root_path
    end
  end
  def item_find
    @item = Item.find(params[:item_id])
  end
end

