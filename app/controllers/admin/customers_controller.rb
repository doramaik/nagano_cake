class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer)
      flash[:notice] = '会員情報編集が成功しました'
    else
      render :edit
      flash[:alret] = '会員情報編集が失敗しました'
    end
  end

  def lists
    @customer =Customer.find(params[:customer_id])
    @orders = @customer.orders
  end


  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :phone_number, :postal_code, :address, :is_deleted)
  end
end
