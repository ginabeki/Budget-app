class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_user!, except: [:splash], only: [:index]
  before_action :authenticate_user!, unless: :public_page?
  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end

  def after_sign_out_path_for(_resource)
    root_path # splash path
  end

  def after_sign_in_path_for(_resource)
    groups_path # groups path
  end

  def public_page?
    controller_name == 'splash' && action_name == 'index'
  end
end
