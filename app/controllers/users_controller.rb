class UsersController < ApplicationController
  before_action :set_user,only:[:show,:edit,:update,:destroy]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  def index
    @users=User.all

  end
  def show
  end
  def new
    @user=User.new
  end
  def create
    
    @user=User.new(user_params)
    if @user.save
      flash[:notice]="User created successfully"
      redirect_to @user
    else
      render 'new'
    end
  end
  def edit
  end
  def update
    if @user.update(user_params)
      flash[:notice]="User updated successfully"
      redirect_to @user
    else
      render 'edit'
    end
  end
  def destroy
    @user.destroy
    redirect_to users_path
  end
  private
  def set_user
    @user=User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name,:role,:email)
  end
  def require_same_user
    if current_user != @user
      flash[:alert] = "You can only edit or delete your own account"
      redirect_to @user
    end
  end
end
