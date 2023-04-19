class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order = Order.new
  end

  def create
    @order = Order.new
    @order.customer_id = current_customer.id
    @order.save
    redirect_to order_confirm_path
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:address_option] == "0"
      @order.delivery_post_code = current_customer.post_code
      @order.delivery_address = current_customer.address
      @order.delivery_address_label = current_customer.first_name
    elsif params[:order][:address_option] == "1"
      @shipping_address = ShippingAddress.find(params[:order][:shipping_address_id])
      @order.delivery_post_code = @shipping_address.post_code
      @order.delivery_address = @shipping_address.address
      @order.delivery_address_label = @shipping_address.address_label
    elsif params[:order][:address_option] = "2"
      @order.delivery_post_code = params[:order][:shipping_post_code]
      @order.delivery_address = params[:order][:shipping_address]
      @order.delivery_address_label = params[:order][:shipping_address_label]
    else
      render 'new'
    end
  end

  def completed
  end

  def index
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :delivery_post_code, :delivery_address, :delivery_address_label)
  end
end


