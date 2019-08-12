class SessionsController < ApplicationController

    def new
        render :layout => 'login'
    end

    def create
        if auth
            user = User.find_or_create_by_omniauth(auth)
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
        user = User.find_by(username: params[:username])
            if user && user.authenticate(params[:password])
                session[:user_id] = user.id 
                user.update_attribute(:last_login, Time.now)
                redirect_to user_path(user)
            else
                @errors = user.error.full_messages
                redirect_to login_path
            end
        end
    end

    def destroy
        reset_session
        redirect_to root_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end

end
