class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Devise
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def after_sign_in_path_for(resource)
    # Base behavior
    stored_location_for(resource) || root_path
  end
  
  def after_sign_out_path_for(resource_or_scope)
    # Keeping user on the same page after signing out
    request.referrer
  end

  protected
  # Devise 
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def set_locale
    session[:locale] = params[:locale] if I18n.available_locales
      .map(&:to_s).include?(params[:locale])
    I18n.locale = session[:locale] || I18n.default_locale
  end
end
