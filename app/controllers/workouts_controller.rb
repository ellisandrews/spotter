class WorkoutsController < ApplicationController

    before_action :set_workout, only: [:show, :edit, :destroy]
    before_action :set_exercises, only: :new

    def index
        @workouts = Workout.order(:name)
    end

    def show
    end

    def new
        @workout = Workout.new
        build_workout_activities(3)  # Make 3 activities associated with the @workout
    end

    def create
        @workout = Workout.new(workout_params)

        if @workout.save
            redirect_to workout_path(@workout)
        else
            set_exercises
            build_workout_activities(3 - @workout.activities.length)
            render :new
        end
    end

    def edit
    end

    def update
        @workout = Workout.assign_attributes(workout_params)

        if @workout.save
            redirect_to workout_path(@workout)
        else
            set_exercises
            render :edit
        end
    end

    def destroy
        begin
            @workout.destroy!
            flash[:message] = 'Workout successfully deleted'
        rescue ActiveRecord::RecordNotFound
            flash[:message] = 'Workout was already deleted'
        rescue ActiveRecord::RecordNotDestroyed
            flash[:message] = "Failed to delete workout"
            redirect_to workout_path(@workout)
        end
        redirect_to workouts_path
    end

    private
    
    def workout_params
        params.require(:workout).permit(
            :name, 
            activities_attributes: [:id, :exercise_id, :sets, :reps, :weight, :_destroy]
        )
    end

    def set_workout
        @workout = Workout.find(params[:id])
    end

    def set_exercises
        @exercises = Exercise.order(:name)
    end

    def build_workout_activities(n)
        @workout ||= set_workout
        n.times { @workout.activities.build } 
    end

end
