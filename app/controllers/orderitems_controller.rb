class OrderitemsController < ApplicationController
  def create
    @order = current_order
    @orderitem = @order.orderitems.new(order_params)
    @order.save
    session[:order_id] = @order.id
  end
  def destroy
    @order = current_order
    @orderitem = @order.orderitems.find(params[:id])
    @orderitem.destroy
    @orderitems = current_order.orderitems
  end
  private
  def order_params
    params.require(:orderitem).permit(:product_id, :quantity)
  end
end
