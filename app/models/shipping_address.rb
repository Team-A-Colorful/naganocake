class ShippingAddress < ApplicationRecord
  belongs_to :customer

  def address_display
    '〒' + post_code + ' ' + address + ' ' + address_label
  end
end
