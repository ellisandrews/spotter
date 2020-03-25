class SessionsController < ApplicationController

    def new
        # Display login form
        render layout: false
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            redirect_to welcome_path
        else
            flash[:notice] = 'Invalid credentials. Please try again.'
            redirect_to login_path
        end
    end

    def welcome
        # Show homepage
    end

end
