class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  validates :count,presence:true


  enum work_status:
  {
    impossible_work:0,
    waiting_work:1,
    working:2,
    finish:3
  }
end
