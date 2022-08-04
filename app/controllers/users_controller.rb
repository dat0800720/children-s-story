class UsersController < ApplicationController
  before_action :find_user, only: [:show ,:edit, :show_archived_user, :update, :destroy]
  load_and_authorize_resource

  def index
    @users = User.search(params[:term])
  end
  
  def show
  end

  def show_archived_user
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
      redirect_to root_path
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

  def favouriting
    @title = "Favouriting"
    @tales = current_user.favouriting.paginate(page: params[:page])
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :bithday, :password, :password_confirmation)
    end

    def find_user
      @user = User.includes(:tales).find_by(id:params[:id])
      unless @user
        redirect_to root_path
      end
    end
end
