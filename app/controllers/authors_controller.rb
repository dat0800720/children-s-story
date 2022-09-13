class AuthorsController < ApplicationController
  before_action :find_author, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      flash[:success] = I18n.t('flash.successful_new_creation')
      redirect_to @author
    else
      flash[:success] = I18n.t('flash.new_creation_failed')
      render 'new'
    end
  end

  def index
    @authors = Author.search(params[:term])
  end

  def show; end

  def edit; end

  def update
    if @author.update(author_params)
      flash[:success] = I18n.t('flash.update_successful')
      redirect_to author_path(@author)
    else
      flash[:success] = I18n.t('flash.update_failed')
      render 'edit'
    end
  end

  def destroy
    @author.destroy
    flash[:success] = I18n.t('flash.successful_delete')
    redirect_to author_url
  end

  private

  def find_author
    @author = Author.includes(:tales).find_by(id: params[:id])
    redirect_to root_path unless @author
  end

  def author_params
    params.require(:author).permit(:name, :profile, :image)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
