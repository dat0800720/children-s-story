class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :load_categories, :load_authors
  rescue_from CanCan::AccessDenied, with: :cancan_access_denied

  private

  def cancan_access_denied
    if logged_in?
      flash[:danger] = "Bạn không có quyền truy cập trang"
      redirect_to root_url
    else
      flash[:danger] = "Vui lòng đăng nhập."
      redirect_to login_url
    end 
  end

  def load_categories
    @categories = Category.all
  end

  def load_authors
    @authors = Author.all
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
