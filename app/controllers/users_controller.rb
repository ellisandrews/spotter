class UsersController < ApplicationController

    def show
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)  # TODO:  Some kind of welcome page? Homepage?
        else
            @user.password = nil
            @user.password_confirmation = nil
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
