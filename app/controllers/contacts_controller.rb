class ContactsController < ApplicationController
    def index
        contacts = Contact.all

        render json: contacts
    end

    def show
        contact = Contact.find(params[:id])

        render json: contact
    end

    def create
        contact = Contact.new(permit_params)

        if contact.valid?
            render json: contact
        else
            render json: {error: "Unable to create contact", details: contact.errors.full_messages}
        end
    end
    

    def update
        contact = Contact.find(params[:id])
        contact.assign_attributes(permit_params)

        if contact.valid?
            render json: contact
        else
            render json: {error: "Unable to update contact", details: contact.errors.full_messages}
        end
    end

    def destroy
        contact = Contact.find(params[:id])
        contact.destroy
    end
    
    private 

    def permit_params
        params.require(:contact).permit(:application_id, :name, :email, :profile_url)
    end
end
