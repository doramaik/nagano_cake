class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      
      redirect_to public_customer_path(current_customer.id)
    else
      
      render :edit
    end
  end

  def quit
  end
  
  def withdraw
  end
  
  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :phone_number, :postal_code, :street_address)
  end
end
