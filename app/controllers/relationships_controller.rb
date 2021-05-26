class RelationshipsController < ApplicationController
  before_action :fined_follow, only: [:create, :destroy]

  def create
    current_user.follow(@tale)
    respond_to do |format|
      format.html { redirect_to @tale }
      format.js
    end
  end

  def destroy
    current_user.unfollow(@tale)
    respond_to do |format|
      format.html { redirect_to @tale }
      format.js
    end
  end

  private

  def fined_follow
    @tale = Tale.find_by(id: params[:followed_id])
  end
end
