class ExperiencesController < ApplicationController
    before_action :logged_in?, only: [:create, :update, :destroy]

    def create
        experience = Experience.new(permit_params)

        if experience.valid?
            experience.save

            render json: experience
        else
            render json: {error: "Unable to create experience", details: experience.errors.full_messages}
        end
    end

    def update
        experience = Experience.find(params[:id])
        experience.assign_attributes(permit_params)
        
        if experience.valid?
            experience.save

            render json: experience
        else
            render json: {error: "Unable to edit experience", details: experience.errors.full_messages}
        end
    end

    def destroy
        experience = Experience.find(params[:id])
        experience.destroy
        
        render json: {message: "Experience deleted"}
    end
    
    private

    def permit_params
        params.require(:experience).permit(:user_id, :title, :exp_type, :description, :completion_date)
    end
end
