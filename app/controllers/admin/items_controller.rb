class Admin::ItemsController < ApplicationController


  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path
      flash[:notice] = '商品を作成しました'
    else
      render :new
      flash[:alret] = '商品作成に失敗しました'
    end
  end

  def index
    @items = Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to admin_item_path
      flash[:notice] = '商品編集が成功しました'
    else
      render :edit
      flash[:alret] = '商品編集が失敗しました'
    end
  end


  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :price, :genre_id, :is_active)
  end

end