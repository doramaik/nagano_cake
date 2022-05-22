class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to request.referer
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    address = Address.find(params[:id])
    if address.update(address_params)
      redirect_to public_addresses_path
    else
      @shipping_address = ShippingAddress.find(params[:id])
      render "customers/addresses/edit"
    end
  end

  private

  def address_params
    params.require(:address).permit(:postal_code,:address,:name)
  end

end
