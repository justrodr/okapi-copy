# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
   def new
    #self.resource = resource_class.new(sign_in_params)
    #store_location_for(resource, params[:redirect_to])
    super
   end

  # POST /resource/sign_in
   def create
    #super
    self.resource = warden.authenticate!(auth_options)
    #set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
    session[:email] = params[:user][:email]
   end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
