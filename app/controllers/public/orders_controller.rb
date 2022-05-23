class Public::OrdersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @order = Order.new
  end

  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    @order = Order.new(order_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    @order.save
    # 4. トップ画面へリダイレクト
    redirect_to public_orders_order_confirm_path
  end

  def order_confirm
    @order = current_customer.orders.new(order_params)
    @cart_item = CartItem.all
    @order = Order.new(
      payment_method: session[:payment_method].to_i,
      shipping_name: session[:shipping_name],
      postal_code: session[:postal_code],
      shipping_address: session[:shipping_address],
      shipping_fee: 800
    )
    @order_details = @order.order_details.all
    # 商品合計を出すため
    @sum = 0
    @subtotals = @order_details.map { |order_detail| order_detail.once_price * order_detail.quantity }
    @sum = @subtotals.sum
  end

  def confirm

  end

  def thanks
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :shipping_address, :shipping_name)
  end
end
