class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    @customer = @order.customer
    @order = Order.find(params[:id])
    @address = Address.find(params[:id])
    @order_details = @order.order_details.all

    # 商品合計を出すため
    @sum = 0
    @subtotals = @order_details.map { |order_detail| order_detail.once_price * order_detail.quantity }
    @sum = @subtotals.sum

  end
end
