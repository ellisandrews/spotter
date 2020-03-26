class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?, :not_found

    def current_user
        if session[:user_id]
            @user = User.find_by(id: session[:user_id])
        end
    end

    def logged_in?
        !!current_user
    end

    def logged_in
        redirect_to login_path unless logged_in?
    end

    def not_found
        raise ActionController::RoutingError.new('Not Found')
    end

end
