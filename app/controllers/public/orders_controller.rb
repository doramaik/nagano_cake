class Public::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
    # 商品合計を出すため
    @sum = 0
    @subtotals = @order_details.map { |order_detail| order_detail.once_price * order_detail.quantity }
    @sum = @subtotals.sum
    @order.shipping_fee = 800
    @order_details = @order.order_details
  end

  def new
    @order = Order.new
  end

  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    # 3. データをデータベースに保存するためのsaveメソッド実行
    @order.save
    @order_details = OrderDetail.new
    @order_details.order_id = @order.id
    @cart_items = current_customer.cart_items

    @cart_items.each do |cart_item|
       @order_details.item_id = cart_item.item.id
       @order_details.price = @order.amount_billed
       @order_details.amount = cart_item.amount

       @order_details.save
    end
    # カート商品を全て削除
    @cart_items.destroy_all

    # 4. リダイレクト
    redirect_to public_orders_thanks_path
  end

  def order_confirm
    @order = current_customer.orders.new(order_params)
    @cart_item = current_customer.cart_items
    @order.shipping_fee = 800
    if params[:order][:address] == "1"
      @order.shipping_address = current_customer.address
      @order.postal_code = current_customer.postal_code
      @order.shipping_name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:address] == "2"
      @addresss = Address.find(params[:order][:address_id])
      @order.shipping_address = @addresss.address
      @order.postal_code = @addresss.postal_code
      @order.shipping_name = @addresss.name
    end

    @order_details = @order.order_details.all
    # 商品合計を出すため
    @sum = 0
    @subtotals = @order_details.map { |order_detail| order_detail.once_price * order_detail.quantity }
    @sum = @subtotals.sum
  end

  def thanks
  end

  private

  def order_params
    params.require(:order).permit(:shipping_fee, :amount_billed, :payment_method, :postal_code, :shipping_address, :shipping_name)
  end
end
