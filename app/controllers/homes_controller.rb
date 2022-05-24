class HomesController < ApplicationController
  def top
    @items = Item.all.order("created_at DESC").limit(4)
    # @all_ranks = Item.find(Order.group(:product_id).order('count(product_id) desc').limit(4).pluck(:product_id))
  end

  def about
  end

end
