class CategoriesController < ApplicationController
  before_action :find_tale, only: [:show ,:edit, :update, :destroy]
  before_action :admin_user,only: [:edit, :update, :destroy]

  def new
    @category = Category.new
  end
  
  def show
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "create ok!"
      redirect_to @category
    else
        render 'new'
    end
  end

  private

  def find_category
    @category = Category.find_by(id:params[:id])
    unless @category
      redirect_to root_path
    end
  end

  def category_params
    params.require(:category).permit(:name)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
