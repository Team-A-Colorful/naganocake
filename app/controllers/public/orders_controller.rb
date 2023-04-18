class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    # @addresses = current_customer.address.all
  end

  def confirm
  end

  def completed
  end

  def index
  end
end
