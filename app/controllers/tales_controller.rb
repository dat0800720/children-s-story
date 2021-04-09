class TalesController < ApplicationController
  before_action :find_tale, only: [:show ,:edit, :update, :destroy]
  before_action :admin_user,only: [:edit, :update, :destroy]

  def index
   @tales = Tale.all.paginate(page: params[:page])
  end

  def show
  end
  
  def new
    @tale = Tale.new
    @categories = Category.all.map{ |c| [c.name, c.id]}
  end

  def create
    @tale = Tale.new(tale_params)
    @tale.category_id = params[:category_id]
    @tale.image.attach(params[:tale][:image])

    if @tale.save
      redirect_to @tale
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @tale.update(tale_params)
      redirect_to tale_path(@tale)
    else
      flash[:success] = "not ok"
      render 'edit'
    end
  end

  def destroy
    @tale.destroy
    flash[:success] = "tale deleted"
    redirect_to tales_url
  end

  private
    def tale_params
      params.require(:tale).permit(:title, :description, :author, :category_id, :image)
    end

    def find_tale
      @tale = Tale.find_by(id:params[:id])
      unless @tale
        redirect_to root_path
      end
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
