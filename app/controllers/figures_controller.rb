class FiguresController < ApplicationController
  before_action :find_figure, only: [:show ,:edit, :update, :destroy]
  before_action :admin_user,only: [:edit, :update, :destroy]

  def index
    @figures = Figure.all.paginate(page: params[:page])
  end

  def show
  end

  private

  def find_figure
    @figure = Figure.find_by(id:params[:id])
    unless @figure
      redirect_to root_path
    end
  end

  def figure_params
    params.require(:figure).permit(:name)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
