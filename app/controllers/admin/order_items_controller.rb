class Admin::OrderItemsController < ApplicationController
  before_action :authenticate_admin!
  def update
    puts params[:id]
    @order_item = OrderItem.find(params[:id])
    @order = @order_item.order
    if @order_item.update(order_item_params)
      if @order.order_items.where(work_status: "working").exists?
        @order.update(order_status: 2)
      elsif @order.order_items.where(work_status: "finish").count == @order.order_items.count
        @order.update(order_status: 3)
      end
      flash[:notice] = "更新しました"
      redirect_to admin_order_path(@order)
    else
      flash[:alert] = "失敗しました"
      render "admin/orders/show"
    end
  end

  private
    def order_item_params
      params.require(:order_item).permit(:order_id, :item_id, :order_price, :count, :work_status)
    end
end
