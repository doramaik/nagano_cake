class Admin::OrdersController < ApplicationController
  def index
  end

  def show
    @customer = @order.customer
    @order = Order.find(params[:id])
    @address = Address.find(params[:id])

  end
end
