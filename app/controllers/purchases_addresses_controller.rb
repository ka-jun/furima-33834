class PurchasesAddressesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]

  def index
    @purchase_address = PurchaseAddress.new
    @item = Item.find(params[:item_id])
  end

  def new
    @purchase_address = PurchaseAddress.new
  end

  def create
    # binding.pry
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_address_params
    params.require(:purchase_address).permit(:postal_code, :shipping_area_id, :city, 
                  :home_number, :building, :tel, :item_id, :token).
                  merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  # def address_params
  #   params.require(:purchase_address).permit(:postal_code, :shipping_area_id, :city, 
  #   :home_number, :building, :tel, :item_id).
  #   merge(user_id: current_user.id, item_id: params[:item_id])
  # end
  # def purchase_params
  #   params.require(:purchase_address).permit(:item_id, :teken).
  #   merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token]))
  # end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_address_params[:token],
      currency: 'jpy'
    )
  end
end
