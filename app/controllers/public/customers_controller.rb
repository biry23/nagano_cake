class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_path
    end
  end

  def withdraw
    @customer = current_customer
    if @customer.update(is_deleted: true)
      # 退会ステータスをデフォルトのfalse(有効)から、true(退会)に更新させる
      sign_out current_customer
    end
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end
end
