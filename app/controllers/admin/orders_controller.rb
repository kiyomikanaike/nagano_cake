class Admin::OrdersController < ApplicationController
  def show
    @cart_items = current_customer.cart_items
    @total_price = 0
    @order = Order.new(order_params)
    @order.delivery_postal_code = current_customer.postal_code
    @order.delivery_address = current_customer.address
    @order.delivery_name = current_customer.last_name+current_customer.first_name
  end

  private
  def order_params
    params.require(:order).permit(:billing_amount,:customer_id,:payment_method,:delivery_postal_code,:delivery_address,:delivery_name)
  end
end
