class CreateShippingAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :shipping_addresses do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :address_label, null: false
      t.string :post_code, null: false
      t.string :address, null: false

      t.timestamps
    end
  end
end
