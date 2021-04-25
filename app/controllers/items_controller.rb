class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :move_to_index, only: :new

  def index
    # @items = Item.all
    # @items = Item.order('created_at DESC')
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
end

private

def item_params
  params.require(:item).permit(
    :image, :name, :text, :category_id, :condition_id, :shipping_charge_id,
    :shipping_area_id, :shipping_day_id, :price
  ).merge(user_id: current_user.id)
end

def move_to_index
  unless user_signed_in?
    redirect_to action: :new_user_session_path
  end
end