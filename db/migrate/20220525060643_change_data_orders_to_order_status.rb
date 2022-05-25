class ChangeDataOrdersToOrderStatus < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :order_status, :integer, default: 0
  end
end
