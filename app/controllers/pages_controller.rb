class PagesController < ApplicationController
    def home 
        if logged_in?
            redirect_to user_path(current_user)
        else
            render :home
        end
    end
end
