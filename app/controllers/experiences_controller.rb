class ExperiencesController < ApplicationController
    before_action :logged_in?, only: [:create, :update, :destroy]

    def create
        experiences = Experience.new(permit_params)

        if experiences.valid?
            experiences.save

            render json: experiences
        else
            render json: {error: "Unable to create experiences", details: experiences.errors.full_messages}
        end
    end

    def update
        experiences = Experience.find(params[:id])
        experiences.assign_attributes(permit_params)
        
        if experiences.valid?
            experiences.save

            render json: experiences
        else
            render json: {error: "Unable to edit experiences", details: experiences.errors.full_messages}
        end
    end

    def destroy
        experiences = Experience.find(params[:id])
        experiences.destroy
        
        render json: {message: "Experience deleted"}
    end
    
    private

    def permit_params
        params.require(:experiences).permit(:user_id, :title, :exp_type, :description)
    end
end
