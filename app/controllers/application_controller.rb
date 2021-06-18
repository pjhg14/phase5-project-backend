class ApplicationController < ActionController::API

    def generate_token(payload)
        JWT.encode(payload, "delicious_christmas")
    end

    def logged_in?
        begin
            token = request.headers["Authorization"].split(" ")[1]
            user_id = JWT.decode(token, "delicious_christmas")[0]["user_id"]
            
            @user = User.find(user_id)
        rescue 
            @user = nil 
        end

        render json: {error: "Please login to access user data"} unless @user
    end
end
