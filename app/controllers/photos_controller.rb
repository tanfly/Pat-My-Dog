class PhotosController < ApplicationController
    before_action :require_login, only: [:show, :index, :new, :create, :edit, :destroy]
    before_action :set_photo, only: [:show, :edit, :update, :destroy]
    
    def index
        if params[:profile_id]
            profile = Profile.find(params[:profile_id])
            @photos = profile.photos
        else
        @photos = Photo.all
        end
    end
    
    def show
        @user = current_user
        @profile = @user.profile
        @pats = @photo.pats
        @comment = @photo.comments.build
        @comments = @photo.comments.where("content is not null and content != ''")
        @categories = @photo.categories.where("name is not null and name != ''")
    end
    
    def new
        if params[:profile_id]
            @profile = Profile.find(params[:profile_id])
            @photo = Photo.new
            @photo.categories.build
            @categories = Category.where("name is not null and name != ''")
        else 
            @profile = current_profile.id
            redirect_to new_profile_photo_path(@profile)
        end
    end
    
    def create
        @photo = Photo.new(photo_params)
        @photo.profile_id = params[:photo][:profile_id]
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
        redirect_to profile_photo_path(@photo.profile_id, @photo.id)
    end
    
    def destroy
        @photo.destroy
        flash[:notice] = "Photo deleted."
        redirect_to profile_photo_path
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
