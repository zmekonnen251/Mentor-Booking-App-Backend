class ApplicationController < ActionController::API
  before_action :configure_permited_parameters, if: :devise_controller?

  protected

  def configure_permited_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :img_url, :bio)
    end

    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end
end
