class ChangePayOptionTypeInOrders < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :pay_option, :integer
  end
end
