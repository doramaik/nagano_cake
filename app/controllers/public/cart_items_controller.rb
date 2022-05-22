class Public::CartItemsController < ApplicationController

  def index
    # @cart_itemsはログイン会員の全てのカート商品
    @cart_items = current_customer.cart_items
    # カート内商品の合計金額 デフォルトを０にする
     @total =0
  end

  def create
    @cart_item =　current_customer.cart_items.new(cart_item_params)
    # 商品が重複しないようにする　@update_cart_itemは追加しようとしている商品　find_byでカート内に同じモノが存在かを確認
    @update_cart_item = CartItem.find_by(item_id: @cart_item.item_id)
    # 追加した商品はカート商品と同じ？
      if @update_cart_item.present?
       # カート商品は(カート商品+追加商品)　個数のみを足す
       @cart_item.count += @update_cart_item.count
       # 個数のみを保存
       @cart_item.update(count: @cart_item.count)
       redirect_to request.referer
      else
       # カート内に同じ商品がなければ新しい商品として保存
       @cart_item.save
       redirect_to request.referer
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
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :count)
  end

end
