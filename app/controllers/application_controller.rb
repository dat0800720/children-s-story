class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :load_categories

  def load_categories
    @categories = Category.all.paginate(page: params[:page])
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
  
end
