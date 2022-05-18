class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
    redirect_to admin_items_path(@item)
    else
    render 'new'
    end
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  private

  def post_image_params
    params.require(:item).permit(:name, :image, :text, :price, :genre_id, :is_active)
  end

end
