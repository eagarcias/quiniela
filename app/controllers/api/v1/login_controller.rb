require_relative "./application_api_controller"

class Api::V1::LoginController < ApplicationApiController

    def create
        user = User.find_by(email: login_params[:email])
        if user
            valid = user.valid_password?(login_params[:password])
            if valid
            token = encode_user_data({sub: user.id})
            return render json: {token: token}
            end
        end
        return render json: {message: "Usuario no valido"}
    end

    def login_params
        
        params.fetch(:login, {}).permit(
            :email,
            :password
        )
    end
end
