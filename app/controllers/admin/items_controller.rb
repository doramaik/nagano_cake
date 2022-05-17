class Admin::ItemsController < ApplicationController

  def new
  end

  def index
    @items = Item.all
    @item = item.new
  end

  def show
  end

  def edit
  end

end
