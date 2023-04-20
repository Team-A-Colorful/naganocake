class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items
  
  validates :delivery_post_code,presence:true
  validates :delivery_address,presence:true
  validates :delivery_address_label,presence:true
  validates :pay_option,presence:true

  enum order_status: {
    "入金待ち":0,
    "入金確認":1,
    "製作中":2,
    "発送準備中":3,
    "発送済み":4
  }

  enum pay_option: {credit_card: 0, transfer: 1 }
end
