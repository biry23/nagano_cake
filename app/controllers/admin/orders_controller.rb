class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_detail = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
  end
end
