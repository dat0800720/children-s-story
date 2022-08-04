class CategoriesController < ApplicationController
  before_action :find_category, only: [:show ,:edit, :update, :destroy]
  before_action :admin_user,only: [:new, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    @categories = Category.search(params[:term])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "create ok!"
      redirect_to categories_path
    else
        render 'new'
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to category_path(@category)
    else
      flash[:success] = "not oke"
      render "edit"
    end
  end

  def destroy
    @category.destroy
    flash[:success] = "category deleted"
    redirect_to category_url
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
