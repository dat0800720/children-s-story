class RelationshipsController < ApplicationController
  def create
    @tale = Tale.find_by(id: params[:followed_id])
    return unless @tale
    current_user.follow(@tale)
    respond_to do |format|
      format.html { redirect_to @tale }
      format.js
    end
  end

  def destroy
    @tale = Tale.find_by(id: params[:followed_id])
    return unless @tale
    current_user.unfollow(@tale)
    respond_to do |format|
      format.html { redirect_to @tale }
      format.js
    end
  end
end
