class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @total_price = 0
  end

  private
  def order_params
    params.require(:order).permit(:billing_amount,:customer_id,:payment_method,:delivery_postal_code,:delivery_address,:delivery_name)
  end
end
