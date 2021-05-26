class TalesController < ApplicationController
  before_action :find_tale, only: [:show, :preview, :edit, :update, :followers, :favouriters, :destroy]
  before_action :admin_user,only: [:new, :edit, :update, :destroy]

  def index
   @tales = Tale.search(params[:term])
  end

  def preview
    if @tale.reviewtales.blank?
      @average_reviewtale = 0
    else
      @average_reviewtale = @tale.reviewtales.average(:rating).round(2)
    end
  end

  def show
   
  end
  
  def new
    @tale = Tale.new
    @categories = Category.all.map { |c| [c.name, c.id]}
  end

  def create
    @tale = Tale.new(tale_params)
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
    redirect_to tales_url
  end

  def followers
    @title = "Followers"
    @tale = Tale.find_by(id: params[:id])
    @tales = @tale.followers.paginate(page: params[:page])
    render "show_follow"
  end

  def favouriters
    @title = "Favouriters"
    @tale = Tale.find_by(id: params[:id])
    @tales = @tale.favouriters.paginate(page: params[:page])
    render "show_favourite"
  end

  private
    def tale_params
      params.require(:tale).permit(:title, :description, :author, :category_id, :image,
        tale_contents_attributes: [:id, :image, :audio, :text, :content_type, :_destroy])
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
