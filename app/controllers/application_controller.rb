class ApplicationController < ActionController::API

    def generate_token(payload)
        JWT.encode(payload, "secret")
    end

    def logged_in?
        begin
            token = request.headers["Authorization"].split(" ")[1]
            user_id = JWT.decode(token, "secret")[0]["user_id"]
            
            @user = User.find(user_id)
        rescue 
            @user = nil 
        end

        unless @renter 
            render json: {error: "Please login to access related data"}  
        end
    end

    
    
end
