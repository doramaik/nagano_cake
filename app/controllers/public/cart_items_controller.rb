class Public::CartItemsController < ApplicationController

  def index
    # @cart_itemsはログイン会員の全てのカート商品
     @cart_items = current_customer.cart_items
    # @cart_items.current_customer_id = current_customer.id
    # @cart_items = CartItem.all
    # カート内商品の合計金額 デフォルトを０にする
     @total =0
  end

  def create
    # byebug
     @cart_item =　current_customer.cart_items.new(cart_item_params)
    #  @cart_item = CartItem.new(cart_item_params)
    #   @cart_item.customer_id = current_customer.id
    # 商品が重複しないようにする　@update_cart_itemは追加しようとしている商品　find_byでカート内に同じモノが存在かを確認
    @update_cart_item = CartItem.find_by(item_id: @cart_item.item_id)
     # 追加した商品はカート商品と同じ？
      if @update_cart_item.present?
       # カート商品は(カート商品+追加商品)　個数のみを足す
       @cart_item.amount += @update_cart_item.amount
       # 個数のみを保存
       @cart_item.update(amount: @cart_item.amount)
       redirect_to public_cart_items_path
      else
       # カート内に同じ商品がなければ新しい商品として保存
       @cart_item.save
       redirect_to public_cart_items_path
      end
  end

  def update
    # 商品の個数のみを変更する
    @cart_item_count = CartItem.find(params[:amount])
    @cart_item_count.update(cart_item_params)
    redirect_to public_cart_items_path
  end

  def destroy
    # 選択した商品を削除する
    # @cart_item = CartItem.find(params[:item_id])
    @cart_item.destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
    # @cart_itemsはログイン会員の全てのカート商品
    @cart_items = current_customer.cart_items
    # カート商品を全て削除
    @cart_items.destroy_all
　　redirect_to public_cart_items_path
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end

end
