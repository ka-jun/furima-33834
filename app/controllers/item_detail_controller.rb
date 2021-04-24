class ItemDetailController < ApplicationController
  def index
    @item_details = Item_detail.order('created_at DESC')
  end

  def new
    @item_detail = Item_detail.new
  end

  def create
    @item_detail = Item_detail.new(item_detail_params)
    if @item_detail.save
      redirect_to root_path
    else
      render :new
    end
  end
end
