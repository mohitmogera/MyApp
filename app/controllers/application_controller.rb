class ApplicationController < ActionController::Base

  protect_from_forgery with: :null_session

  respond_to :json

#   before_action :underscore_params!
  # before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user
    private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

    def authenticate_user
      puts("authenicate")
      puts(request.headers['Authorization'])
        if request.headers['Authorization'].present?
            authenticate_or_request_with_http_token do |token|
            begin
                puts("auth called")
                jwt_payload = JWT.decode(token, Rails.application.secrets.secret_key_base).first
               
                puts(jwt_payload)
                @current_user_id = jwt_payload['id']
            rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
                puts("unauth1")
                head :unauthorized
            end
            end
        end
    end

    def authenticate_user!(options = {})
        puts("unauth")
        head :unauthorized unless signed_in?
      end
    
      def current_user
        puts("current_user")
        puts(@current_user_id)
        @current_user ||= super || User.find(@current_user_id)
      end
    
      def signed_in?
        puts("signed_in")
        @current_user_id.present?
      end
end
