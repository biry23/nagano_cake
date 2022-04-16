class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @subtotal = 0
    @total_price = 0
    @shipping_cost = 800

  end

  def status_update
    # 注文ステータスのupdate
    @order = Order.find(params[:id])
    @order.update(order_params)
    if params[:order][:status] == "入金確認"
      order_details.update(order_detail_params)
    end
    redirect_to admin_order_path(@order)
  end

  def making_status_update
    # 製作ステータスのupdate
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    redirect_to admin_order_path(@order_detail.order_id)
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end

