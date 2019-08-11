class PagesController < ApplicationController
    def home 
        render :layout => false
        if logged_in?
            redirect_to user_path(current_user)
        end
    end
end
