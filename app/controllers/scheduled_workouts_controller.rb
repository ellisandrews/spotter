class ScheduledWorkoutsController < ApplicationController

    def index
        @scheduled_workouts = current_user.scheduled_workouts
    end

end
