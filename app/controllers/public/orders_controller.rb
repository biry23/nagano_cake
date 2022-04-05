class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def index
  end

  def show
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to orders_complete_path
    else
      render :confirm
    end
  end

  def confirm
  end

  def complete
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end

end
