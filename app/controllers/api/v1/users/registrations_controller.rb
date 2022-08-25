class Api::V1::Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource(sign_up_params)

    resource.save

    if resource.persisted?
      render json: { message: 'Signed up successfully' }, status: :created
    else
      render json: { errors: resource.errors }, status: :unprocessable_entity
    end
  end

  private

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    render json: { message: 'Signed up successfully.' }, status: :ok
  end

  def register_failed
    render json: { message: 'Something went wrong.' }, status: :unprocessable_entity
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email name avatar avatar_cache remove_avatar])
  end
end
