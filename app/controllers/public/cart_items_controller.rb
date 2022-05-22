class Public::CartItemsController < ApplicationController

  def index
  # ログインしている会員のカートアイテム
    @cart_item = current_cart.cart_items
  end

  def create
     @cart_item = CartItem.new(cart_item_params)
     @cart_item.customer_id = current_customer.id
    if @cart_item.save
      redirect_to public_items_path,notice: "ありがとうございます。"
    else
      @item = Item.find(params[:cart_item][:item_id])
      render "public/items/show"
    end
  end

  def update
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to request.referer
  end

  def destroy_all

  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :count)
  end

end
