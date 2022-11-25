class TalesController < ApplicationController
  before_action :find_tale,
                only: [:show, :preview, :edit, :update, :followers, :favouriters, :update_status,
                       :update_status_refused, :destroy]
  before_action :add_to_create, only: :create
  load_and_authorize_resource

  def index
    @tales = Tale.search(params[:term])
  end

  def show_waiting_censorship
    @tales = Tale.waiting_censorship.paginate(page: params[:page])
    @show_waiting_censorships = Tale.waiting_censorship.paginate(page: params[:page])
  end

  def newest
    @newests = Tale.approved.paginate(page: params[:page]).order_by_id
  end

  def many_follow
    @many_followers = Tale.approved.paginate(page: params[:page]).sort_by_follow
  end

  def many_favourite
    @many_favourites = Tale.approved.paginate(page: params[:page]).sort_by_favourite
  end

  def preview
    @average_reviewtale = if @tale.reviewtales.blank?
                            0
                          else
                            @tale.reviewtales.average(:rating)
                          end
  end

  def show
    @tale.update view: @tale.view.to_i + 1
  end

  def new
    @tale = Tale.new
  end

  def create
    if @tale.save
      flash[:success] = I18n.t('flash.successful_new_creation')
      redirect_to @tale
    else
      flash[:success] = I18n.t('flash.new_creation_failed')
      render 'new'
    end
  end

  def edit; end

  def update_status
    if @tale.approved!
      flash[:success] = I18n.t('flash.update_successful')
    else
      flash[:danger] = I18n.t('flash.update_failed')
    end
    redirect_to show_waiting_censorship_tales_path
  end

  def update_status_refused
    if @tale.refused!
      redirect_to edit_tale_path
    else
      flash[:danger] = I18n.t('flash.update_failed')
      redirect_to show_waiting_censorship_tales_path
    end
  end

  def update
    if @tale.update(tale_params)
      redirect_to preview_tale_path(@tale)
      flash[:success] = I18n.t('flash.update_successful')
    else
      flash[:success] = I18n.t('flash.update_failed')
      render 'edit'
    end
  end

  def destroy
    @tale.destroy
    flash[:success] = I18n.t('flash.successful_delete')
    redirect_to tales_url
  end

  def followers
    @title = 'Followers'
    @tale = Tale.find_by(id: params[:id])
    @tales = @tale.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  def favouriters
    @title = 'Favouriters'
    @tale = Tale.find_by(id: params[:id])
    @tales = @tale.favouriters.paginate(page: params[:page])
    render 'show_favourite'
  end

  private

  def tale_params
    params.require(:tale).permit(:title, :description, :author_user, :category_id, :image, :author_id, :user_id, :reason_reject,
                                 tale_contents_attributes: [:id, :image, :audio, :text, :content_type, :_destroy])
  end

  def find_tale
    @tales = Tale.all
    @tale = Tale.includes(tale_contents: [image_attachment: :blob]).find_by(id: params[:id])
    redirect_to root_path unless @tale
  end

  def add_to_create
    @tale = Tale.new(tale_params)
    @tale.image.attach(params[:tale][:image])
    @tale.status = current_user.admin? ? 'approved' : 'waiting_censorship'
    @tale.user_id = current_user.id
  end
end
