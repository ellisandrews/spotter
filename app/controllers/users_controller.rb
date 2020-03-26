class UsersController < ApplicationController

    before_action :authorized
    skip_before_action :authorized, only: [:new, :create]

    def show
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path
        else
            @user.password = nil
            @user.password_confirmation = nil
            render :new
        end
    end

    def edit
    end

    def update
        @user.assign_attributes(user_params)

        if @user.save
            redirect_to user_path(@user)
        else
            render :edit
        end
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

end
