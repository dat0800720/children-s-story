class StaticPagesController < ApplicationController
  def home
    @tales = Tale.all.paginate(page: params[:page])
  end

  def about
  end

  def contact
  end
end
