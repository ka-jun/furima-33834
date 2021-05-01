class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]

  def index
    @items = Item.order('created_at DESC')
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
    # if @item.user_id == current_user.id
    #   render :edit
    # else redirect_to root_path
    # end
  end

end

private

def item_params
  params.require(:item).permit(
    :image, :name, :text, :category_id, :condition_id, :shipping_charge_id,
    :shipping_area_id, :shipping_day_id, :price
  ).merge(user_id: current_user.id)
end
