class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
    @cart_items = current_customer.cart_items
    @total_price = 0
    @order = Order.new(order_params)
    @order.delivery_postal_code = current_customer.postal_code
    @order.delivery_address = current_customer.address
    @order.delivery_name = current_customer.last_name+current_customer.first_name
  end

  def complete
  end

  def create
    cart_items = current_customer.cart_items.all
    # @order.delivery_name =params[:order][:delivery_name]
    @order = Order.new(order_params)
    @order.postage = 800
    if @order.save
    cart_items.each do |cart|
      order_item = OrderItem.new
      order_item.item_id = cart.item_id
      order_item.order_id = @order.id
      order_item.purchase_price = @order.billing_amount
      order_item.amount = cart.amount
      order_item.save
    end

    redirect_to orders_complete_path
    cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end


  def index

  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:billing_amount,:customer_id,:payment_method,:delivery_postal_code,:delivery_address,:delivery_name)
  end

end
