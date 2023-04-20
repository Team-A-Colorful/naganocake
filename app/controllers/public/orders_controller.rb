class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    current_customer.cart_items.each do |cart_item|
      @order_item = OrderItem.new
      @order_item.order_id =  @order.id
      @order_item.item_id = cart_item.item_id
      @order_item.count = cart_item.count
      @order_item.order_price = (cart_item.item.price*1.1).floor
      @order_item.work_status = 1
      @order_item.save
    end
    current_customer.cart_items.destroy_all
    redirect_to orders_completed_path
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.delivery_post_code = current_customer.postal_code
      @order.delivery_address = current_customer.address
      @order.delivery_address_label = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
       @address = Address.find(params[:order][:address_id])
       @order.delivery_post_code = @address.postal_code
       @order.delivery_address = @address.address
       @order.delivery_address_label = @address.name
    elsif params[:order][:select_address] == "2"
      @order.customer_id = current_customer.id
    end
    @cart_items = current_customer.cart_items
    @order_new = Order.new
    render :confirm
  end

  def completed
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :shipping_fee, :total_price, :pay_option, :delivery_post_code, :delivery_address, :delivery_address_label, :order_status)
  end
end


