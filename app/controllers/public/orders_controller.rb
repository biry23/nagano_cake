class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    # 注文の保存
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
      # 注文詳細商品一つ一つの保存
      @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
        @order_detail = OrderDetail.new
        @order_detail.order_id = @order.id
        @order_detail.item_id = cart_item.item.id
        @order_detail.price = cart_item.item.with_tax_price
        @order_detail.amount = cart_item.amount
        @order_detail.save
      end
      current_customer.cart_items.destroy_all
      redirect_to orders_complete_path
    end
  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @total_price = 0
    @order.shipping_cost = 800

    if params[:order][:my_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.name = current_customer.last_name + current_customer.first_name
      @order.address = current_customer.address
    elsif params[:order][:my_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.name = @address.name
      @order.address = @address.address
    end

  end

  def complete
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method)
  end

end
