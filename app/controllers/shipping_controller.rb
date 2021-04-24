class ShippingController < ApplicationController
  def index
    @shippings = Sipping.order('created_at DESC')
  end

  def new
    @shipping = Sipping.new
  end

  def create
    @shipping = Sipping.new(shipping_params)
    if @shipping.save
      redirect_to root_path
    else
      render :new
    end
  end
end
