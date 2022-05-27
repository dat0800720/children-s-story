class ApplicationController < ActionController::Base
  before_action :load_categories, :load_authors
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from CanCan::AccessDenied, with: :cancan_access_denied

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def cancan_access_denied
    if user_signed_in?
      flash[:danger] = I18n.t('flash.no_right')
      redirect_to root_url
    else
      flash[:danger] = I18n.t('flash.please_log_in')
      redirect_to new_user_session_path
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
