class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            user.update_attribute(:last_login, Time.now)
            redirect_to user_path(user)
        else
            flash[:message] = "Username or Password is Incorrect"
            redirect_to login_path
        end
    end

    def destroy
        reset_session
        redirect_to root_path
    end
end
