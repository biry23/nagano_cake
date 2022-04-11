class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order.status = 0
    @order_detail = @order.order_details
    @order_detail.maiking_status = 0
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
  end
end
