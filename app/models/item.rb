class Item < ApplicationRecord
  belongs_to :genre
  has_many :order_items, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  attachment :image
  
  
  #税込価格を計算するためのメソットです。
  #viewページで下記のように呼び出してもらえれば表示できます。
  #<%= @item.add_tax_salse_price.to_s(:delimited) %>
  #(:delimited)は数値を3桁区切りにするためのものです。例: 12345678 → 12,345,678
  def add_tax_sales_price
    (self.price * 1.10).round
  end
  
end
