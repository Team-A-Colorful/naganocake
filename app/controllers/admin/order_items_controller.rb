class Admin::OrderItemsController < ApplicationController
  before_action :authenticate_admin!
  def update
    @order_item = OrderItem.find(params[:id])
    if @order_item.update(order_item_params)
      flash[:notice] = "更新しました"
      redirect_to admin_order_path
    else
      flash[:alert] = "失敗しました"
      render "show"
    end
  end


  private
  def order_item_params
    params.require(:order_item).permit(:order_id, :item_id, :order_price, :count, :work_status)
  end
end
