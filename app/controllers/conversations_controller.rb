class ConversationsController < ApplicationController
    def index
        conversations = Conversation.all

        render json: conversations
    end

    def show
        conversation = Conversation.find(params[:id])

        render json: conversation
    end

    def create
        conversation = Conversation.new(permit_params)

        if conversation.valid?
            conversations.save

            render json: {message: "Successfully added conversation"}
        else
            render json: {error: "Unable to create conversation", details: conversation.errors.full_messages}
        end
    end
    

    def update
        conversation = Conversation.find(params[:id])
        conversation.assign_attributes(permit_params)

        if conversation.valid?
            conversations.save

            render json: {message: "Successfully edited conversation"}
        else
            render json: {error: "Unable to update conversation", details: conversation.errors.full_messages}
        end
    end

    def destroy
        conversation = Conversation.find(params[:id])
        conversation.destroy

        render json: {message: "Conversation deleted"}
    end
    
    private 

    def permit_params
        params.require(:conversation).permit(:contact_id, :content, :contact_date)
    end
end
