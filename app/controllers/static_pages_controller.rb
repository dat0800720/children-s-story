class StaticPagesController < ApplicationController
  def home
    @tales = Tale.active.paginate(page: params[:page])
    @newest_tales = Tale.active.order_by_id.limit(8)
    @many_followers = Tale.active.sort_by_follow[0..7]
    @many_favourites = Tale.active.sort_by_favourite[0..7]
    @views = Tale.active.views_rating_by_day.limit(7)
  end

  def about
  end

  def contact
  end
end
