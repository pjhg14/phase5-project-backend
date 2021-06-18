class ApplicationsController < ApplicationController
    before_action :logged_in?, only: [:query]

    def index
        # applications = Application.all
        applications = Application.includes(:user).all

        render json: applications
    end

    def query
        applications = @user.applications

        render json: applications
    end
    

    def show
        application = Application.find(params[:id])

        render json: application
    end

    def create
        application = Application.new(permit_params)

        # handle business creation with application
        if params[:business]
            # TODO
        end

        # handle contact creation with application
        if params[:contact]
            # TODO
        end
        

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
        application.contacts.destroy_all
        application.destroy

        contacts = Application.all.

        render json: {message: "Application and related contacts deleted"}
    end
    
    private 

    def permit_params
        params.require(:application).permit(:user_id, :business_id, :apply_date, :start_date, :wage_type, :wage)
    end

    def permit_business_params
        params.require(:business).permit(:name, :address, :field, :description)
    end
    
    def permit_contact_params
        params.require(:contact).permit(:application_id, :name, :email, :profile_url)
    end
    
end
