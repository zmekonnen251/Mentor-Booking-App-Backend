class ApplicationController < ActionController::API
  before_action :configure_permited_parameters, if: :devise_controller?
  before_action do
    ActiveStorage::Current.url_options = { protocol: request.protocol, host: request.host, port: request.port }
  end

  protected

  def configure_permited_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :avatar, :bio)
    end

    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end
end
