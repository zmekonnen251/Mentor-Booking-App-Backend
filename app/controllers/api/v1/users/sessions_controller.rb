class Api::V1::Users::SessionsController < Devise::SessionsController
  respond_to :json

  # POST /resource/sign_in
  def create
    possible_aud = request.headers['HTTP_JWT_AUD'].presence || request.headers['JWT_AUD'].presence
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    if user_signed_in?
      last = resource.allowlisted_jwts.where(aud: possible_aud).last

      if last.present?
        last.update_columns({
                              browser_data: params[:browser],
                              os_data: params[:os],
                              remote_ip: params[:ip]
                            })
      end

      @user_data = { user: resource, avatar: resource.img_url }

      respond_with(@user_data)

    else
      render json: resource.errors, status: 401
    end
  rescue StandardError
    render json: { errors: I18n.t('api.oops') }, status: 500
  end

  private

  def current_token
    request.env['warden-jwt_auth.token']
  end

  def respond_with(resource, opts = {})
    render json: {
      user: resource,
      jwt: current_token,
      aud: opts[:aud]
    }
  end

  def respond_to_on_destroy
    render json: { message: 'Signed out successfully' }
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

  # private

  # def respond_with(resource, _opts = {})
  #   render json: {message: 'You are logged in.'}, status: :ok
  # end

  # def respond_to_on_destroy
  #   log_out_success && return if current_user

  #   log_out_failure
  # end

  # def log_out_success
  #   render json: {message: 'You are logged out.'}, status: :ok
  # end

  # def log_out_failure
  #   render json: {message: 'You are not logged in.'}, status: :unauthorized
  # end
end
