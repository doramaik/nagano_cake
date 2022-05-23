class RenameCountColumnToCartItems < ActiveRecord::Migration[6.1]
  def change
    rename_column :cart_items, :count, :amount
  end
end
