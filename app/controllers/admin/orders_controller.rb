class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.page(params[:page])
  end

  def show

    @order = Order.find(params[:id])
    @order_details = @order.order_details


    #  商品合計を出すため
    # @sum = 0
    # @subtotals.each do |a|
    #   @sum = @sum+a
    # end
    @subtotals = @order_details.map { |order_detail| order_detail.price }
    @sum = @subtotals.sum

  end


  def update
    # 商品の個数のみを変更する
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to request.referer
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end

end
