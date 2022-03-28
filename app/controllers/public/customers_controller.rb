class Public::CustomersController < ApplicationController
  def show
    @customer = Current_customer
  end

end
