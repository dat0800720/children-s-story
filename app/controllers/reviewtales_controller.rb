class ReviewtalesController < ApplicationController
  before_action :find_tale
  before_action :find_reviewtale, only: [:edit, :update, :destroy]
  load_and_authorize_resource

  def create
    @reviewtale = @tale.reviewtales.new(reviewtale_params)
    respond_to do |format|
      @reviewtale.save
      format.html { redirect_to preview_tale_path(@tale) }
      format.js
    end
  end

  def edit; end

  def update
    respond_to do |format|
      @reviewtale.update(reviewtale_params)
      format.html { redirect_to preview_tale_path(@tale) }
      format.js
    end
  end

  def destroy
    respond_to do |format|
      @reviewtale.destroy
      format.html { redirect_to preview_tale_path(@tale) }
      format.js
    end
  end

  private

  def reviewtale_params
    params.require(:reviewtale).permit(:rating, :comment).merge({ user_id: current_user.id })
  end

  def find_tale
    @tale = Tale.find_by(id: params[:tale_id])
    redirect_to root_path unless @tale
  end

  def find_reviewtale
    @reviewtale = Reviewtale.includes(:user).find_by(id: params[:id])
    redirect_to root_path unless @reviewtale
  end
end
