class MusclesController < ApplicationController

    def index
        @muscles = Muscle.order(:name)
    end

    def show
        @muscle = Muscle.find(params[:id])
    end

end
