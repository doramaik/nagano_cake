class OrderDetail < ApplicationRecord
   enum production_status: { production_inpossible: 0, production_pending: 1, in_production: 2, production_complete: 3}
   belongs_to :item
   belongs_to :order


    ##小計を求めるメソッド
  def subtotal
    item.with_tax_price*amount
  end

end
