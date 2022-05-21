class HomesController < ApplicationController

  def top
    @items = Item.all
  end

  def index
  end

  def about
  end

end
