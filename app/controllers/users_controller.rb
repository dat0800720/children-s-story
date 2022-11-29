class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :show_waiting_censorship_user, :update, :destroy]
  load_and_authorize_resource

  def index
    @users = User.search(params[:term])
  end

  def show; end

  def show_waiting_censorship_user
    @my_story = current_user.tales.where(status: [1, 2])
  end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = I18n.t('flash.welcome_to_the_tales_baby')
      redirect_to root_path
    else
      render 'new'
      flash[:success] = I18n.t('flash.new_creation_failed')
    end
  end

  def update
    if @user.update(user_params)
      flash[:success] = I18n.t('flash.update_successful')
      redirect_to @user
    else
      flash[:success] = I18n.t('flash.update_failed')
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:success] = I18n.t('flash.successful_delete')
    redirect_to users_url
  end

  def following
    @title = 'Following'
    @tales = current_user.following.paginate(page: params[:page])
  end

  def favouriting
    @title = 'Favouriting'
    @tales = current_user.favouriting.paginate(page: params[:page])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :bithday, :password, :password_confirmation, :cover_image, :image, :image_cache)
  end

  def find_user
    @user = User.includes(:tales).find_by(id: params[:id])
    redirect_to root_path unless @user
  end
end
