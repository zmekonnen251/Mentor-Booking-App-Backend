class Api::V1::Mentors::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  respond_to :json

  def create
    possible_aud = request.headers['HTTP_JWT_AUD'].presence || request.headers['JWT_AUD'].presence
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    if mentor_signed_in?
      last = resource.allowlisted_mentors_jwts.where(aud: possible_aud).last
      aud = possible_aud || 'UNKNOWN'

      if last.present?
        last.update_columns({
                              browser_data: params[:browser],
                              os_data: params[:os],
                              remote_ip: params[:ip]
                            })
        aud = last.aud
      end

      @mentor_data = { mentor: resource, avatar: url_for(resource.avatar) }

      respond_with(@mentor_data, { aud: })
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
      mentor: resource,
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
end
