class BusinessesController < ApplicationController

    def index # refactor later to only show all buisnesses related to currently logged in user
        # businesses = Business.all
        businesses = Business.includes(:applications).all

        render json: businesses
    end

    def show
        buisness = Business.find(params[:id])

        render json: buisness
    end

    def create
        buisness = Business.new(permit_params)
        if buisness.valid?
            buisness.save

            render json: buisness
        else
            render json: {error: "Unable to create business", details: buisness.errors.full_messages}
        end
    end
    
    def update
        buisness = Business.find(params[:id])
        buisness.assign_attributes(permit_params)

        if buisness.valid?
            render json: buisness
        else
            render json: {error: "unable to update business", details: buisness.errors.full_messages}
        end
    end
    
    def destroy # TODO: check if user is logged in before deleting
        buisness = Business.find(params[:id])

        buisness.destroy
    end
    
    private 

    def permit_params
        params.require(:business).permit(:name, :address, :field, :description)
    end
    
end
