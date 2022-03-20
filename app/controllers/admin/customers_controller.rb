class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page])
    @customer = Customer.new
  end

  def show
    @customer = Customer.find(params[:id])
  end
end
