class ApplicationsController < ApplicationController
    before_action :logged_in?, only: [:user_index, :show, :create, :update, :destroy]
    # before_action :logged_in?, only: [:show, :create, :update, :destroy]

    def index # testing purposes only
        applications = Application.includes(:user).all

        render json: applications
    end

    def user_index
        # applications = User.first.applications.includes(:user)
        applications = @user.applications.includes(:user)

        render json: applications
    end

    def show
        # application = Application.includes(:user).find(params[:id])
        application = @user.applications.includes(:user).find(params[:id])

        render json: application
    end

    def create
        # handle business creation with application
        if params[:business]
            # TODO
            business = Business.create(permit_business_params)
        end
        
        # handle contact creation with application
        if params[:contact]
            # TODO
            contact = Contact.create(permit_contact_params)
        end

        application = Application.new(permit_params.merge({ business: business }))

        if application.valid?
            application.save

            render json: {message: "Successfully created application", id: application.id}
        else
            render json: {error: "Unable to create application", details: application.errors.full_messages}
        end
    end

    def update
        application = Application.find(params[:id])
        application.assign_attributes(permit_params)

        if application.valid?
            application.save

            render json: {message: "Successfully updated application", id: application.id}
        else
            render json: {error: "Unable to update application", details: application.errors.full_messages}
        end
    end

    def destroy
        application = Application.find(params[:id])
        application.contacts.destroy_all
        application.destroy

        render json: {message: "Application and related contacts deleted"}
    end
    
    private 

    def permit_params
        params.require(:application).permit(:user_id, :business_id, :alias, :role, :apply_date, :start_date, :wage_type, :wage)
    end

    def permit_business_params
        params.require(:business).permit(:user_id, :name, :address, :field, :description)
    end
    
    def permit_contact_params
        params.require(:contact).permit(:application_id, :name, :email, :profile_url)
    end
    
end
