class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected 

  def configure_permitted_parameters
    attributes = [:first_name, :last_name]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
    #user_params.permit(:username, :email)
  end
  def after_sign_in_path_for(resource)
    if resource.admin
      admin_path
    else
      request.env['omniauth.origin'] || stored_location_for(resource) || dash_path
    end
  end
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
   def after_resetting_password_path_for(resource)
     root_path
   end
  include DashBoardHelper
  include PropertiesHelper

  add_flash_types :danger, :info, :warning, :success

end
