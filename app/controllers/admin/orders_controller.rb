class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
    @order.status = 0
    @order_details = @order.order_detail

  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
  end
end
