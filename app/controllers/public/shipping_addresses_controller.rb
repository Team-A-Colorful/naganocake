class Public::ShippingAddressesController < ApplicationController
  def index
    @customer = current_customer
    @shipping_address = ShippingAddress.new
    @shipping_addresses = @customer.shipping_addresses.all
  end

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end
  
  def create
    shipping_address = ShippingAddress.new(shipping_address_params)
    shipping_address.customer=current_customer
    shipping_address.save
    redirect_to request.referer
  end
  
  def update
    @shipping_address = ShippingAddress.find(params[:id])
    @shipping_address.update(shipping_address_params)
    redirect_to shipping_addresses_path
  end
  
  
   def shipping_address_params
    params.require(:shipping_address).permit(:address_label, :post_code, :address)
  end
  
end
