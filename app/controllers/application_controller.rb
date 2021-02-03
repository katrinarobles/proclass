class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address, :phone, :bio, :teacher, :photo, :facebook, :instagram, :blog, :website, :username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :address, :phone, :bio, :teacher, :photo, :facebook, :instagram, :blog, :website, :username])
  end

  private

   def after_sign_in_path_for(resource)
     # After you enter login info and click submit, I want you to be sent to the registrations#show page
     dashboard_path
   end
   def after_sign_out_path_for(resource_or_scope)
     new_user_session_path
   end

end
