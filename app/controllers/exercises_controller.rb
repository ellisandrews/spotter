class ExercisesController < ApplicationController

    before_action :logged_in
    before_action :set_exercise, only: [:show, :edit, :update, :destroy]

    def index
        @exercises = Exercise.order(:name)
    end

    def show
    end

    # TODO: Admin only below here, as exercises are shared across users at present
    def new
        @exercise = Exercise.new
    end

    def create
        @exercise = Exercise.new(exercise_params)

        if @exercise.save
            redirect_to exercise_path(@exercise)
        else
            render :new
        end
    end

    def edit
    end

    def update
        @exercise.assign_attributes(exercise_params)

        if @exercise.save
            redirect_to exercise_path(@exercise)
        else
            render :edit
        end
    end

    def destroy
        begin
            @exercise.destroy!
            flash[:message] = 'Exercise successfully deleted'
        rescue ActiveRecord::RecordNotFound
            flash[:message] = 'Exercise was already deleted'
        rescue ActiveRecord::RecordNotDestroyed
            flash[:message] = "Failed to delete exercise"
            redirect_to exercise_path(@exercise)
        end
        redirect_to exercises_path
    end

    private

    def exercise_params
        params.require(:exercise).permit(:name, :description, :image_url)
    end

    def set_exercise
        @exercise = Exercise.find(params[:id])
    end

end
