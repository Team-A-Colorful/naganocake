class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @customers=Customer.all.page(params[:page]).per(10)
  end

  def show
    @customer=Customer.find(params[:id])
  end

  def edit
    @customer=Customer.find(params[:id])
  end

  def update
    @customer=Customer.find(params[:id])
    if @customer.update(customer_params)
     redirect_to admin_customer_path(@customer)
    else
     render :edit
    end
  end
  
  def order_history
    @customer=Customer.find(params[:customer_id])
    @orders=@customer.orders.all.page(params[:page]).per(10)
  end

 
  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :post_code, :address, :telephone_number, :email, :membership_status)
  end

end