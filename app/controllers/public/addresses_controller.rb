class Public::AddressesController < ApplicationController
  #全てのアクションの前にユーザーがログインしているか確認する。
  #ログインしていない時、ログインページに遷移。
  before_action :authenticate_customer!

  def index
    @address = Address.new
    @addresses = Address.all
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id

    if @address.save
      redirect_to request.referer
      flash[:notice] = "配送先を登録しました。"
    else
      render :index
      @addresses = Address.all
    end

  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to public_addresses_path
      flash[:notice] = "配送先を変更しました。"
    else
      render :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to request.referer
  end


  private

  def address_params
    params.require(:address).permit(:postal_code,:address,:name)
  end

end
