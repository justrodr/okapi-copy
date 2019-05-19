# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
   def new
    @user = User.new
   end

  # POST /resource
   def create
   #super
   build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        #set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
        session[:email] = params[:user][:email]
      else
        #set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      #respond_with resource, location: new_user_registration_path
      redirect_to new_user_registration_path
      flash[:danger] = @user.errors.full_messages.to_sentence
    end
   end

   def destroy
     super
     @properties = Property.where(user: @user.id);@orders = Order.where(user: @user.id)
     @properties.destroy_all;@orders.destroy_all
   end

   #private 
   #def user_params
    #  params.require(:user).permit(:first_name, :last_name, :email, :password, :password_conformation)
   #end

  # GET /resource/edit
   def edit
     super
   end

  # PUT /resource
   def update
     #super
     self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    resource_updated = update_resource(resource, account_update_params)
    yield resource if block_given?
    if resource_updated
      set_flash_message_for_update(resource, prev_unconfirmed_email)
      bypass_sign_in resource, scope: resource_name if sign_in_after_change_password?

      #respond_with resource, location: after_update_path_for(resource)
      redirect_to dash_path
    else
      clean_up_passwords resource
      set_minimum_password_length
      #respond_with resource
      redirect_to edit_user_registration_path
      flash[:danger] = @user.errors.full_messages.to_sentence
    end
   end

  # DELETE /resource


  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

   protected

   def update_resource(resource, params)
    if resource.provider == "facebook"
      resource.update_without_password(params.except("current_password"))
    else
      return super if params["password"]&.present?
    end
   end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
