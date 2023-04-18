class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :order_price, null: false
      t.integer :count, null: false
      t.integer :work_status, null: false

      t.timestamps
    end
  end
end
