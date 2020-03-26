class WorkoutsController < ApplicationController

    before_action :authorized
    before_action :set_workout, only: [:show, :edit, :update, :destroy, :add]
    before_action :set_exercises, only: [:new, :edit]

    # TODO: Don't hard-code this, let user control
    @@num_activities = 3

    def index
        @workouts = Workout.where.not(user: current_user).order(:name)
    end

    def show
    end

    def new
        @workout = Workout.new
        build_workout_activities(@@num_activities)  # Make new activities associated with the workout
    end

    def create
        @workout = Workout.new(workout_params)
        @workout.user = current_user

        if @workout.save
            redirect_to workout_path(@workout)
        else
            re_render_form_view :new
        end
    end

    def edit
        build_workout_activities(@@num_activities - @workout.activities.length)
    end

    def update
        @workout.assign_attributes(workout_params)

        if @workout.save
            redirect_to workout_path(@workout)
        else
            re_render_form_view :edit
        end
    end

    def destroy
        begin
            @workout.destroy!
            flash[:message] = 'Workout successfully deleted'
        rescue ActiveRecord::RecordNotFound
            flash[:error] = 'Workout was already deleted'
        rescue ActiveRecord::RecordNotDestroyed
            flash[:error] = "Failed to delete workout"
            redirect_to workout_path(@workout)
        end
        redirect_to workouts_path
    end

    def add
        new_workout = @workout.dup
        new_workout.user = current_user
        
        if new_workout.save
            redirect_to workout_path(new_workout)
        else
            flash[:error] = 'Failed to add workout'
            redirect_to workouts_path
        end
    end

    private
    
    def workout_params
        params.require(:workout).permit(
            :name,
            :description,
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
        n.times { @workout.activities.build } 
    end

    def re_render_form_view(view)
        set_exercises
        build_workout_activities(@@num_activities - @workout.activities.length)
        render view
    end
end
