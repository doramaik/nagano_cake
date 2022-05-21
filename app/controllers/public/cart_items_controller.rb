class Public::CartItemsController < ApplicationController

  def index
  # ログインしている会員のカートアイテム
    @cart_item = current_cart.cart_items
  end

  def create
    
    
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
