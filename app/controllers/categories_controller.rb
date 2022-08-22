class CategoriesController < ApplicationController
  before_action :set_category,only:[:show,:edit,:update,:destroy,:products]
  before_action :require_user, except: [:show, :index]
  before_action :require_admin_user, only: [:edit, :update, :destroy]
  def index
    @categories=Category.all
  end
  def show
    @products=@category.products
  end
  def new
    @category=Category.new
  end

  def create
    @category=Category.new(category_params)
    if @category.save
      flash[:notice]="Category created successfully"
      redirect_to @category
    else
      render 'new'
    end
  end
  def edit
  end
  def update
    if @category.update(category_params)
      flash[:notice]="Category updated successfully"
      redirect_to @category
    else
      render 'edit'
    end
  end
  def destroy
    @category.destroy
    redirect_to categories_path
  end
  private
  def set_category
    @category=Category.find(params[:id])
  end
  def category_params
    params.require(:category).permit(:name)
  end
  def require_admin_user
    if current_user.role!='admin'
      flash[:alert] = "Admin can only modify categories"
      redirect_to @category
    end
  end
end
