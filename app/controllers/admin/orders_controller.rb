class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:notice] = "更新しました"
      redirect_to admin_order_path
    else
      flash[:alert] = "失敗しました"
      render "show"
    end
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :shipping_fee, :total_price, :pay_option, :delivery_post_code, :delivery_address, :delivery_address_label, :order_status)
  end
end
