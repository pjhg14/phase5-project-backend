class SitesController < ApplicationController
    before_action :logged_in?, only: [:create, :update, :destroy]

    def create
        site = Site.new(permit_params)

        if site.valid?
            site.save

            render json: site
        else
            render json: {error: "Unable to create site", details: site.errors.full_messages}
        end
    end

    def update
        site = Site.find(params[:id])
        site.assign_attributes(permit_params)
        
        if site.valid?
            site.save

            render json: site
        else
            render json: {error: "Unable to edit site", details: site.errors.full_messages}
        end
    end

    def destroy
        site = Site.find(params[:id])
        site.destroy
        
        render json: {message: "Site deleted"}
    end
    
    private

    def permit_params
        params.require(:site).permit(:user_id, :domain, :url)
    end
end
