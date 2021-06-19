class BusinessesController < ApplicationController
    before_action :logged_in?, only: [:user_index, :show, :create, :update, :destroy]

    def index # refactor later to only show all buisnesses related to currently logged in user
        # businesses = Business.all
        businesses = Business.includes(:applications).all

        render json: businesses
    end

    def user_index
        businesses = @user.businesses.includes(:applications)

        render json: businesses
    end

    def show
        business = @user.businesses.includes(:applications).find(params[:id])

        render json: business
    end

    def create
        business = Business.new(permit_params)
        if business.valid?
            business.save

            render json: {message: "Successfully created business"}
        else
            render json: {error: "Unable to create business", details: business.errors.full_messages}
        end
    end
    
    def update
        business = Business.find(params[:id])
        business.assign_attributes(permit_params)

        if business.valid?
            business.save

            render json: {message: "Successfully edited business"}
        else
            render json: {error: "unable to update business", details: buisness.errors.full_messages}
        end
    end
    
    def destroy # TODO: check if user is logged in before deleting
        business = Business.find(params[:id])
        business.applications.destroy_all
        business.destroy

        render json: {message: "Business and related applications deleted"}
    end
    
    private 

    def permit_params
        params.require(:business).permit(:user_id, :name, :address, :field, :description)
    end
    
end
