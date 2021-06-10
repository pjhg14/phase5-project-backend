class UsersController < ApplicationController
    # insert logged_in? before_action here for relevent routes

    def index # Temporary, delete once JWT auth is implemented 
        users = User.all

        render json: users
    end

    def show
        user = User.find(params[:id])

        if user
            render json: user
        else
            render json: {error: "User not found"}
        end
        
    end

    def create
        user = User.new(permit_params)
        if user.valid?
            user.save

            render json: user
        else
            render json: {error: "Unable to create user", details: user.errors.full_messages}
        end
    end
    
    def update
        user = User.find(permit_params)
        user.assign_attributes(permit_params)

        if user.valid?
            user.save

            render json: user
        else
            render json: {error: "Unable to edit user data", details: user.errors.full_messages}
        end
    end
    
    private 

    def permit_params
        params.permit(:username, :first_name, :last_name, :suffix, :phone, :email)
    end
    
    
end
