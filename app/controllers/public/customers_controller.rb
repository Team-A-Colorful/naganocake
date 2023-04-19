class Public::CustomersController < ApplicationController
  def show
  end

  def edit
  end
  
  def withdraw
  end
  
  def resign
    customer = current_customer
    customer.membership_status = false
    redirect_to root_path
  end
end
