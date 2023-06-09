class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer
  
  validates :count,presence:true
  
  def sum_of_price
    item.add_tax_sales_price * count
  end 
end
