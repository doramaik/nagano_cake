class Public::CartItemsController < ApplicationController

  def index
    # @cart_itemsはログイン会員の全てのカート商品
    @cart_items = current_customer.cart_items
    # カート内商品の合計金額 デフォルトを０にする
     @total =0
  end

  def create
    cart_item = current_customer.cart_items.new(cart_params)                                                                   #新しく客がカートに登録した商品をcart_itemとする。
     if current_customer.cart_items.exists?(item_id: cart_item.item_id)                                                         #もし、cart_itemのitem_idが、客のカート内のcart_itemsテーブル内に存在していたら
        add_items = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])                                  #客のcart_itemsテーブル内から、特定の[:cart_item][:item_id]であるものを選んで add_itemsという名前で保存
        add_items.count+= params[:cart_item][:count].to_i                                                                # add_itemsのquantity
        add_items.save
        redirect_to  public_cart_items_path
     else
       cart_item = CartItem.new(cart_params)
       cart_item.save
       redirect_to  cart_items_path
     end
  end

  def update
    # 商品の個数のみを変更する
    @cart_item_count = CartItem.find(params[:count])
    @cart_item_count.update(cart_item_params)
    redirect_to request.referer
  end

  def destroy
    # 選択した商品を削除する
    @cart_item = CartItem.find(params[:item_id])
    @cart_item.destroy
    redirect_to request.referer
  end

  def destroy_all
    # @cart_itemsはログイン会員の全てのカート商品
    @cart_items = current_customer.cart_items
    # カート商品を全て削除
    @cart_items.destroy_all
　　redirect_to request.referer
  end

  private
  def cart_params
      params.require(:cart_item).permit(:item_id, :count)
  end

end
