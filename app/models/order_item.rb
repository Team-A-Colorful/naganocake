class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  validates :count,presence:true
  
end
