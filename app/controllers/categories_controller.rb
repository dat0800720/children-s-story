class CategoriesController < ApplicationController
  before_action :find_category, only: [:edit, :update, :destroy]
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
      flash[:success] = I18n.t('flash.successful_new_creation')
      redirect_to categories_path
    else
      render 'new'
      flash[:success] = I18n.t('flash.new_creation_failed')
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      flash[:success] = I18n.t('flash.update_successful')
      redirect_to category_path(@category)
    else
      flash[:success] = I18n.t('flash.update_failed')
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    flash[:success] = I18n.t('flash.successful_delete')
    redirect_to categories_path
  end

  private

  def find_category
    @category = Category.includes(:tales).find_by(id: params[:id])
    redirect_to root_path unless @category
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
