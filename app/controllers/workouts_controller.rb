class WorkoutsController < ApplicationController

    def index
        @workouts = Workout.order(:name)
    end

    def show
        @workout = Workout.find(params[:id])
    end

    def new
        @workout = Workout.new
        3.times { @workout.activities.build }  # Make some empty activity so there is one displayed in the form
        @exercises = Exercise.order(:name)
    end

    def create
        @workout = Workout.new(workout_params)

        if @workout.save
            redirect_to workout_path(@workout)
        else
            # p '***************'
            # p "ERRORS: #{ @workout.errors.full_messages { |key, value| p "#{key}: #{value}" } }"
            # p '***************'
            render :new
            # puts render_to_string :new
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
