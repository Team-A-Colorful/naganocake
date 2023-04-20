class ShippingAddress < ApplicationRecord
  belongs_to :customer

  validates :address_label,presence:true
  validates :post_code,presence:true
  validates :address,presence:true


  def address_display
    '〒' + post_code + ' ' + address + ' ' + address_label
  end
end
