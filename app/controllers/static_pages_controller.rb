class StaticPagesController < ApplicationController
  # rubocop:disable Metrics/AbcSize
  def home
    @tales = Tale.approved.paginate(page: params[:page])
    @newest_tales = Tale.approved.order_by_id.limit(8)
    @many_followers = Tale.includes(:followers).approved.sort_by_follow[0..7]
    @many_favourites = Tale.includes(:favouriters).approved.sort_by_favourite[0..7]
    @views = Tale.approved.views_rating_by_day.limit(7)
    @new_user_month_now = User.new_user_month_now
    @new_user_last_month = User.new_user_last_month
    @new_user_two_month_ago = User.new_user_two_month_ago
    @new_user_three_month_ago = User.new_user_three_month_ago
    @views_admin = Tale.approved.views_rating_by_day.limit(6)
    @many_favourites_admin = Tale.includes(:favouriters).approved.sort_by_favourite[0..5]
    @many_followers_admin = Tale.includes(:followers).approved.sort_by_follow[0..5]
  end
  # rubocop:enable Metrics/AbcSize

  def about; end

  def contact; end
end
