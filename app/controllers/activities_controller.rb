class ActivitiesController < ApplicationController

    before_action :authorized

    def show
        @activity = Activity.find(params[:id])
    end

end
