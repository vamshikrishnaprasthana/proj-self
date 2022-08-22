class CartsController < ApplicationController
  def add_to_cart
    @q=Product.ransack(params[:q])
    @products=@q.result(distinct:true)
    @orderitem = current_order.orderitems.new
  end
  def show
    @orderitems=current_order.orderitems
  end
end
