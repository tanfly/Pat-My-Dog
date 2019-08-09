class PhotosController < ApplicationController
    before_action :require_login, only: [:show, :index, :new, :create, :edit, :destroy]
    before_action :set_photo, only: [:show, :edit, :update, :destroy]
    
    def index
        @photos = Photo.all
    end
    
    def show
        @profile = Profile.find(params[:profile_id])
        @user = @profile.user
        @pats = @photo.pats
    end
    
    def new
        @profile = Profile.find(params[:profile_id])
        @photo = Photo.new
    end
    
    def create
        @photo = Photo.new(photo_params)
        @photo.profile_id = params[:photo][:profile_id]
        @photo.categories.build
            if @photo.save
                redirect_to profile_photo_path(@photo.profile_id, @photo.id)
            else
                flash[:error] = "Please ensure all areas are filled out correctly."
                redirect_to request.referer
            end
    end
    
    def edit
    end
    
    def update
        @photo.update(photo_params)
        redirect_to user_photo_path(@photo)
    end
    
    def destroy
        @photo.destroy
        flash[:notice] = "Photo deleted."
        redirect_to user_pictures_path
    end
    
    private
    
    def set_photo
        @photo = Photo.find(params[:id])
    end
    
    def photo_params
        params.require(:photo).permit(:image, :description, :profile_id, :album_id, category_ids:[], categories_attributes: [:name])
    end

    def require_login
        if !logged_in?
            flash[:error] = "You are not logged in"
            redirect_to login_path
        end
    end
end
