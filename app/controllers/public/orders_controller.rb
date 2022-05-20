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
    order = Order.new(order_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    order.save
    # 4. トップ画面へリダイレクト
    redirect_to public_orders_path
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
