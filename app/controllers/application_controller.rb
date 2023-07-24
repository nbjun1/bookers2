class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  belong_action :is_matching_login_user, only: [:edit, :update]

  def after_singn_in_path_for(resource)
    user_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
