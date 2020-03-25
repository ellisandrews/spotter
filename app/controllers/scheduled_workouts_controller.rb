class ScheduledWorkoutsController < ApplicationController

    before_action :authorized

    def index
        @scheduled_workouts = current_user.scheduled_workouts
    end

end
