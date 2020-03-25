class UsersController < ApplicationController

    before_action :authorized
    skip_before_action :authorized, only: [:new, :create]

    def show
        # TODO: User profile page
    end

    def new
        # Show signup form
        @user = User.new
        render layout: false
    end

    def create
        @user = User.new(user_params)
        
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path
        else
            @user.password = nil
            @user.password_confirmation = nil
            render :new, layout: false
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
