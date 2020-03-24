class WorkoutsController < ApplicationController

    def index
        @workouts = Workout.order(:name)
    end

    def show
        @workout = Workout.find(params[:id])
    end

    def new
        @workout = Workout.new
        3.times { @workout.activities.build }  # Make some empty activities so they're displayed in the form
        @exercises = Exercise.order(:name)
    end

    def create
        @workout = Workout.new(workout_params)

        if @workout.save
            redirect_to workout_path(@workout)
        else
            render :new
        end
    end

    private
    
    def workout_params
        params.require(:workout).permit(
            :name, 
            activities_attributes: [:id, :exercise_id, :sets, :reps, :weight, :_destroy]
        )
    end

end
