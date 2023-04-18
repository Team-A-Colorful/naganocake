class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :delivery_post_code, null: false
      t.string :delivery_address, null: false
      t.string :delivery_address_label, null: false
      t.integer :shipping_fee, null: false
      t.integer :total_price, null: false
      t.string :pay_option, null: false
      t.integer :order_status, null: false

      t.timestamps
    end
  end
end
