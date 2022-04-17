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
    # 製作ステータスの自動更新
    if params[:order][:status] == "payment_confirmation"
      @order.order_details.update_all(making_status: 1)
      # update_allにすることで注文商品の製作ステータスが更新される
    end
    redirect_to admin_order_path(@order)
  end

  def making_status_update
    # 製作ステータスのupdate
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @one_order = @order.order_details

    if @order_detail.update(order_detail_params)
    # 注文ステータスの自動更新
      if params[:order_detail][:making_status] == "production"
        @order_detail.order.update(status: 2)
      end

      if @one_order.count == @one_order.where(making_status: "complete").count
        # １件に紐づいたorderのorder_detailsの数 == 左辺のorder_detailsのmaking_statusがcompleteになっている数
        @order_detail.order.update(status: 3)
      end
      redirect_to admin_order_path(@order_detail.order_id)
    end
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end

