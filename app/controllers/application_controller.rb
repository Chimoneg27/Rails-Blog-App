class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :json_request?
  protect_from_forgery with: :exception, unless: -> { request.format.json? }
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end

  protected

  def json_request?
    request.format.json?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password password_confirmation bio])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name email password password_confirmation bio])
  end
end
