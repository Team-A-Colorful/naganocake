class Public::InformationController < ApplicationController
  before_action :authenticate_customer!
  def show
    @customer=current_customer
  end

  def edit
    @customer=current_customer
  end

  def update
    current_customer.update(customer_params)
    redirect_to customers_information_path
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :post_code, :address, :telephone_number, :email)
  end
end
