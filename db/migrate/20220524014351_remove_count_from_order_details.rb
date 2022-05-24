class RemoveCountFromOrderDetails < ActiveRecord::Migration[6.1]
  def change
    remove_column :order_details, :count, :integer
  end
end
