class UsersController < ApplicationController

    before_action :logged_in, except: [:new, :create]
    before_action :authorized, except: [:new, :create]

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
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    def authorized
        not_found if params[:id] && params[:id].to_i != @user.id
    end

end
