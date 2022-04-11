class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order.status = 0
    @order_details = @order.order_detail
    
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
  end
  
  private
  def order_detail_params
    params.require(:order).permit(:)
end
