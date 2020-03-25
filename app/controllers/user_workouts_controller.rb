class UserWorkoutsController < ApplicationController

    def index
        @user_workouts = UserWorkout.where(user: current_user)
    end

end
