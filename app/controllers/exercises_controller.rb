class ExercisesController < ApplicationController

    before_action :logged_in
    before_action :set_exercise, only: [:show, :edit, :update, :destroy]
    before_action :set_muscles, only: [:new, :edit]

    def index
        @exercises = Exercise.order(:name)
    end

    def show
    end

    def new
        @exercise = Exercise.new
    end

    def create
        @exercise = Exercise.new(exercise_params)

        if @exercise.save
            redirect_to exercise_path(@exercise)
        else
            re_render_form_view :new
        end
    end

    # Note: No routes for edit/update/destroy right now, as they are shared across users and should be admin-restricted
    def edit
    end

    def update
        @exercise.assign_attributes(exercise_params)

        if @exercise.save
            redirect_to exercise_path(@exercise)
        else
            re_render_form_view :edit
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
        params.require(:exercise).permit(:name, :description, :image_url, :muscle_ids => [])
    end

    def set_exercise
        @exercise = Exercise.find(params[:id])
    end

    def set_muscles
        @muscles = Muscle.order(:name)
    end

    def re_render_form_view(view)
        set_muscles
        render view
    end

end
