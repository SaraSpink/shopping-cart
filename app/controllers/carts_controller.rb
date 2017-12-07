class CartsController < ApplicationController
  def show
    @order_items = current_order.order_items
    @total_cost = current_order.calculate_total
  end
end
