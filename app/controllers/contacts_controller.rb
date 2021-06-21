class ContactsController < ApplicationController
    before_action :logged_in?, only: [:user_index, :show, :create, :update, :destroy]
    # before_action :logged_in?, only: [:show, :create, :update, :destroy]

    def index
        contacts = Contact.all

        render json: contacts
    end

    def user_index
        # contacts = User.first.applications.map {|application| application.contacts}.flatten
        contacts = @user.applications.map {|application| application.contacts}.flatten

        render json: contacts
    end

    def show
        contact = Contact.find(params[:id])

        render json: contact
    end

    def create
        contact = Contact.new(permit_params)

        if contact.valid?
            contact.save

            render json: {message: "Successfully created contact", id: contact.id}
        else
            render json: {error: "Unable to create contact", details: contact.errors.full_messages}
        end
    end
    

    def update
        contact = Contact.find(params[:id])
        contact.assign_attributes(permit_params)

        if contact.valid?
            contact.save

            render json: {message: "Successfully edited contact", id: contact.id}
        else
            render json: {error: "Unable to update contact", details: contact.errors.full_messages}
        end
    end

    def destroy
        contact = Contact.find(params[:id])
        contact.conversations.destroy_all
        contact.destroy

        render json: {message: "Contact and related conversations deleted"}
    end
    
    private 

    def permit_params
        params.require(:contact).permit(:application_id, :first_name, :last_name, :suffix, :email, :profile_url)
    end
end
