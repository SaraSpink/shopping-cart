class OrderItemsController < ApplicationController

  def index
    @order_items = OrderItem.all
  end


  def show
  end


  def new
    @order_item = OrderItem.new
  end


  def edit
  end


  def create
    @order = current_order
    @item = @order.order_items.new(item_params)
    @order.save
     session[:order_id] = @order.id
     redirect_to products_path
  end


  def destroy
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.destroy
    @order.save
    redirect_to cart_path
  end

  private

    def item_params
       params.require(:order_item).permit(:quantity, :product_id)
    end

end
