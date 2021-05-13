class PurchasesController < ApplicationController 

  def index
    @purchase_address = PurchaseAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
        redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :shipping_area_id, :city, 
                  :home_number, :building, :tel, :item_id).merge(user_id: current_user.id)
  end

  def item_params
    params.require(:item).permit(
      :image, :name, :text, :category_id, :condition_id, :shipping_charge_id,
      :shipping_area_id, :shipping_day_id, :price
    ).merge(user_id: current_user.id)
  end
end
