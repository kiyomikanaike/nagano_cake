class Public::CartItemsController < ApplicationController
  def index
    
  end
  
  
  def update
    
  end
  
  
  def destroy
    
  end
  
  
  def destroy_all
    
  end
  
  
  def create
    @cart_item = Cart_item.new(cart_item_params)
    @item.save
    redirect_to #ショッピングカートページ(@cart_item.id)
  end
  
  
  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
    
end
