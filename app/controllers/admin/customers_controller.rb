class Admin::CustomersController < ApplicationController
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
    @customer.update(customer_params)
    redirect_to edit_admin_customer_path(@customer)
  end
  
  
  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :post_code, :address, :telephone_number, :email, :membership_status)
  end

end