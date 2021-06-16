class StaticPagesController < ApplicationController
  def home
    @tales = Tale.active.paginate(page: params[:page])
    @newest_tales = Tale.active.order_by_id
    @many_followers = Tale.active.sort_by_follow
    @many_favourites = Tale.active.sort_by_favourite
  end

  def about
  end

  def contact
  end
end
