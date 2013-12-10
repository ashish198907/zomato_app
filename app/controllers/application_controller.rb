class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def require_admin
    unless user_signed_in? && current_user.is_admin?
      flash[:error] = "You don't have enough privileges to access this page."
      redirect_to home_url
    end
  end

  def after_sign_in_path_for(resource)
    home_path
  end
end
