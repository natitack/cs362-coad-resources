class ApplicationController < ActionController::Base
  # trying to fix actionController::InvalidAuthenticityToken error
  protect_from_forgery with: :null_session
  
  def after_sign_in_path_for(resource)
    dashboard_path
  end

  protected

  def authenticate_admin
    redirect_to(dashboard_path, alert: 'Access denied.') unless current_user&.admin?
  end

end
