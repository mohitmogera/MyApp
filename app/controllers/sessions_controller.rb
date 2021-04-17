class SessionsController < Devise::SessionsController
  include ActionController::Helpers
  include ActionController::Flash
    def create
      user = User.find_by_email(sign_in_params[:email])
  
      if user && user.valid_password?(sign_in_params[:password])
          puts("session")          
          current_user = user
          puts(current_user.generate_jwt)
          token = current_user.generate_jwt         
          render json: { auth_token: token  }
      else
        render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
      end
    end
  end
  