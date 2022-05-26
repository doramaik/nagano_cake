class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :postal_code
      t.string :shipping_address
      t.string :shipping_name
      t.integer :amount_billed
      t.integer :shipping_fee
      t.integer :payment_method
      t.integer :order_status

      t.timestamps
    end
  end
end
