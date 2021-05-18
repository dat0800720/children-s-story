class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :following, :destroy]
  before_action :admin_user,only: :destroy
  before_action :find_user, only: [:show ,:edit, :update, :destroy]
  before_action :correct_user,only: [:edit, :update]

  def index
    @users = User.all.paginate(page: params[:page])
  end
  
  def show
  end
  
  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the tales baby!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def following
    @title = "Following"
    @tales = current_user.following.paginate(page: params[:page])
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
      :password_confirmation)
    end

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end 

    def find_user
      @user=User.find_by(id:params[:id])
      unless @user
        redirect_to root_path
      end
    end

    def correct_user
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
