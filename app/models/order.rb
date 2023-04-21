class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items
  
  validates :delivery_post_code, format: {with: /\A[0-9]{7}\z/}
  validates :delivery_address,presence:true
  validates :delivery_address_label,presence:true
  validates :pay_option,presence:true

  enum pay_option: {credit_card: 0, transfer: 1 }
  enum order_status: {wait_payment: 0, confirm_payment: 1, making: 2, preparing_ship: 3, finish_prepare: 4}

end
