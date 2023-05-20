class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  def subtotal_order_item
      purchase_price * amount
  end
end
