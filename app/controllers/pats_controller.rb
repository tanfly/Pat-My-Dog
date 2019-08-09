class PatsController < ApplicationController
    before_action :require_login
    before_action :find_photo

    def index
            @photo.pats.create(user_id: current_user.id)
            redirect_to profile_photo_path(@photo.profile_id, @photo.id)
    end

    private

    def require_login
        if !logged_in?
            flash[:error] = "You are not logged in"
            redirect_to login_path
        end
    end

    def find_photo
        @photo = Photo.find(params[:photo_id])
    end
end
