class UsersController < ApplicationController

    before_action :logged_in, except: [:index, :new, :create]
    before_action :authorized, except: [:index, :new, :create]

    def index
        # When a user makes an invalid new user request, this takes them to `/users`.
        # As we have no users index view, if they refresh the page here just refresh the signup page.
        redirect_to signup_path
    end

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
            redirect_to profile_path
        else
            render :edit
        end
    end

    def analytics
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
    end

    def authorized
        not_found if params[:id] && params[:id].to_i != @user.id
    end

end
