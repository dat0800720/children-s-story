class TalesController < ApplicationController
  before_action :find_tale, only: [:show, :preview, :edit, :update, :followers, :destroy]
  before_action :admin_user,only: [:edit, :update, :destroy]

  def index
   @tales = Tale.all.paginate(page: params[:page])
  end

  def preview
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
    @tale = Tale.find(params[:id])
    @tales = @tale.followers.paginate(page: params[:page])
    render 'show_follow'
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
