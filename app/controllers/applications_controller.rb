class ApplicationsController < ApplicationController

    def index
        applications = Application.all

        render json: applications
    end

    def show
        application = Application.find(params[:id])

        render json: application
    end

    def create
        application = Application.new(permit_params)

        if application.valid?
            render json: application
        else
            render json: {error: "Unable to create application", details: application.errors.full_messages}
        end
    end
    

    def update
        application = Application.find(params[:id])
        application.assign_attributes(permit_params)

        if application.valid?
            render json: application
        else
            render json: {error: "Unable to update application", details: application.errors.full_messages}
        end
    end

    def destroy
        application = Application.find(params[:id])
        application.destroy
    end
    
    private 

    def permit_params
        params.require(:application).permit(:user_id, :business_id, :apply_date, :start_date, :wage_type, :wage)
    end
    
end
