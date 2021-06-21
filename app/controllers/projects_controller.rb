class ProjectsController < ApplicationController
    before_action :logged_in?, only: [:create, :update, :destroy]

    def create
        project = Project.new(permit_params)

        if project.valid?
            project.save

            render json: project
        else
            render json: {error: "Unable to create project", details: project.errors.full_messages}
        end
    end

    def update
        project = Project.find(params[:id])
        project.assign_attributes(permit_params)
        
        if project.valid?
            project.save

            render json: project
        else
            render json: {error: "Unable to edit project", details: project.errors.full_messages}
        end
    end

    def destroy
        project = Project.find(params[:id])
        project.destroy
        
        render json: {message: "Project deleted"}
    end
    
    private

    def permit_params
        params.require(:project).permit()
    end
end
