class ScheduledWorkoutsController < ApplicationController

    before_action :logged_in
    before_action :set_scheduled_workout, only: [:show, :edit, :update, :destroy]
    before_action :set_workouts, only: [:new, :edit]

    def index
        @scheduled_workouts = current_user.scheduled_workouts
    end

    def show
    end

    def new
        @scheduled_workout = ScheduledWorkout.new
    end

    def create
        @scheduled_workout = ScheduledWorkout.new(scheduled_workout_params)

        if @scheduled_workout.save
            redirect_to scheduled_workouts_path
        else
            re_render_form_view :new
        end
    end

    def edit
    end

    def update
        @scheduled_workout.assign_attributes(scheduled_workout_params)

        if @scheduled_workout.save
            redirect_to scheduled_workouts_path
        else
            re_render_form_view :edit
        end
    end

    def destroy
        begin
            @scheduled_workout.destroy!
            flash[:message] = 'Scheduled workout successfully deleted'
        rescue ActiveRecord::RecordNotFound
            flash[:message] = 'Scheduled workout was already deleted'
        rescue ActiveRecord::RecordNotDestroyed
            flash[:message] = "Failed to delete scheduled workout"
            redirect_to scheduled_workout_path(@scheduled_workout)
        end
        redirect_to scheduled_workouts_path
    end

    private

    def scheduled_workout_params
        params.require(:scheduled_workout).permit(:date, :completed, :workout_id)
    end

    def set_scheduled_workout
        @scheduled_workout = ScheduledWorkout.find(params[:id])
    end

    def set_workouts
        @workouts = current_user.workouts
    end

    def re_render_form_view(view)
        set_workouts
        render view
    end

end
