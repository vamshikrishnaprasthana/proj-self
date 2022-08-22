module ApplicationHelper
  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
  def require_user
    if !user_signed_in?
      flash[:alert] = "You must be logged in to perform that action"
      redirect_to users_path
    end
  end
end
