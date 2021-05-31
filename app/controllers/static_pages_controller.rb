class StaticPagesController < ApplicationController
  def home
    @tales = Tale.all.paginate(page: params[:page])
    @newest_tales = Tale.all.order_by_id
    @many_followers = Tale.all.sort_by_follow
    @many_favourites = Tale.all.sort_by_favourite
  end

  def about
  end

  def contact
  end
end
