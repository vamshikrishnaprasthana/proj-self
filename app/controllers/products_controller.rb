class ProductsController < ApplicationController
  before_action :set_product, only: [:show,:edit,:update,:destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_admin_user, only: [:create,:edit, :update, :destroy]
  def index
    @q=Product.ransack(params[:q])
    @products=@q.result(distinct:true)
    @products= Product.paginate(:page => params[:page], :per_page=>3)
    @orderitem = current_order.orderitems.new
  end
  def new
    @product=Product.new
  end
  def create
    @product=Product.new(product_params)
    if @product.save
      flash[:notice]="Product created sucessfully"
      redirect_to @product
    else
      render 'new'
    end
  end
  def edit
  end
  def update
    if @product.update(product_params)
      flash[:notice]="Product updated successfully"
      redirect_to @product
    else
      render 'edit'
    end
  end
  def destroy
    @product.destroy
    redirect_to products_path
  end
  private
  def set_product
    @product=Product.find(params[:id])
  end
  def product_params
    params.require(:product).permit(:name,:cost,:description,:rating)
  end
  def require_admin_user
    if current_user.role!='admin'
      flash[:alert] = "Admin can only modify products"
      redirect_to @product
    end
  end
end
