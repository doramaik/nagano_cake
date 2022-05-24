class Admin::OrderDetailsController < ApplicationController

  def update
     # 商品の個数のみを変更する
    @order_details = OrderDetail.find(params[:id])
    @order_details.update(order_details_params)
    redirect_to request.referer
  end



  private

  def order_details_params
    params.require(:order_detail).permit(:production_status)
  end
end
