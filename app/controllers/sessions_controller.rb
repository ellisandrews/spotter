class SessionsController < ApplicationController

    before_action :logged_in, only: [:destroy]

    def new
        # Display login form
    end

    def create
        user = User.find_by(email: params[:email])
        p user.full_name
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path
        else
            flash[:error] = 'Invalid credentials. Please try again.'
            redirect_to login_path
        end
    end

    def welcome
        # current_user  # Set the current user to @user if applicable
    end

    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end

end
