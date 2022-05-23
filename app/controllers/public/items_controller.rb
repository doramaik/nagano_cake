class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @cart_item.customer_id = current_customer.id
  end


  private

  def cart_item_params
    params.require(:item).permit(:amount,:item_id)
  end
end
