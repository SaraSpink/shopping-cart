class OrderItemsController < ApplicationController

  def index
    @order_items = OrderItem.all
  end


  def show
    @order_item = OrderItem.find(params[:id])

  end


  def new
    @order_item = OrderItem.new
  end


  def edit
    @order_item = OrderItem.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end


  def create
    @order = current_order
    @item = @order.order_items.new(item_params)
    @order.save
     session[:order_id] = @order.id
     redirect_to products_path
  end

  def update
  @order_item = OrderItem.find(params[:id])
    if @order_item.update(item_params)
    redirect_to cart_path
    else
    render :edit
     end
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
