class Public::CartItemsController < ApplicationController
  def index
    @item = CartItem.all
  end


  def update

  end


  def destroy

  end


  def destroy_all

  end


  def create
    #byebug
    @item = Item.find(cart_item_params[:item_id])
    @item.save
    redirect_to cart_items_path
  end


  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end

end
