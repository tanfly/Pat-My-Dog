class ProfilesController < ApplicationController

    before_action :require_login, only: [:show, :destroy]
    before_action :set_profile, only: [:show, :destroy]

    def show
        @user = @profile.user
    end


    def destroy
        @profile.destroy
        @profile.user.destroy
        redirect_to signup_path
    end

    private

    def require_login
        if !logged_in?
            @errors = ["Please login first."]
            redirect_to login_path
        end
    end

    def set_profile
        @profile = Profile.find(params[:id])
    end

end
