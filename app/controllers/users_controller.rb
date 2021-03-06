class UsersController < ApplicationController
    # before_action :logged_in?, only: [:show, :update]
    before_action :logged_in?, only: [:dashboard, :show, :update]

    def index # TODO: delete once testing is done
        users = User.all

        render json: users
    end

    def admin_query # TODO: delete once testing is done
        user = User.find(params[:id])

        render json: user
    end

    def login
        user = User.find_by(email: params[:email])

        if user && user.authenticate(params[:password])
            render json: {confirmation: "success!", token: generate_token({user_id: user.id})}
        else
            render json: {error: "Unable to login", details: ["User not found: Incorrect username or password"]}
        end
    end

    # aka: sign-up
    def create
        user = User.new(permit_params)
        if user.valid?
            user.save

            render json: {confirmation: "success!", token: generate_token({user_id: user.id})}
        else
            render json: {error: "Unable to create user", details: user.errors.full_messages}
        end
    end

    def dashboard
        render json: @user.dashboard
    end
    
    def show
        render json: @user
    end
    
    def update
        @user.assign_attributes(permit_params)

        if @user.valid?
            @user.save

            render json: @user
        else
            render json: {error: "Unable to edit user data", details: @user.errors.full_messages}
        end
    end
    
    private 

    def permit_params
        params.permit(:username, :password, :first_name, :last_name, :suffix, :phone, :email)
    end
    
    
end
