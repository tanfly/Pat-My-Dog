class PhotosController < ApplicationController
    before_action :require_login, only: [:show, :index, :new, :create, :edit]
    before_action :set_photo, only: [:show, :edit, :update, :destroy]
    
    def index
        if params[:profile_id]
            @profile = Profile.find(params[:profile_id])
            @photos = @profile.photos
            if params[:sort_order] == "high_to_low"
                photos = @profile.photos
                high_to_low(photos)
            elsif params[:sort_order] == "low_to_high"
                photos = @profile.photos
                low_to_high(photos)
            end
        elsif
            if params[:sort_order] == "user_sort"
                photos = Photo.all
                user_sort(photos)
            elsif params[:sort_order] == "high_to_low"
                photos = Photo.all
                high_to_low(photos)
            elsif params[:sort_order] == "low_to_high"
                photos = Photo.all
                low_to_high(photos)
            end
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
        if params[:album_id]
            @album = Album.find(params[:album_id])
        end
        @profile = current_user.profile
        @photo = Photo.new
        @photo.categories.build
    end
    
    def create
        @profile = current_user.profile
        @photo = Photo.new(photo_params)
        @photo.profile_id = params[:photo][:profile_id]
            if @photo.save
                redirect_to profile_photo_path(@photo.profile_id, @photo.id)
            else  
                render :new
            end
    end
    
    def edit
        @profile = @photo.profile
    end
    
    def update
        @photo.update(photo_params)
        redirect_to profile_photo_path(@photo.profile_id, @photo.id)
    end
    
    def destroy
        @photo.destroy
        redirect_to profile_photos_path(current_profile)
    end
    
    private
    
    def set_photo
        @photo = Photo.find(params[:id])
    end
    
    def photo_params
        params.require(:photo).permit(:image, :description, :profile_id, :album_id, :sort_order, category_ids:[], categories_attributes: [:name])
    end

    def require_login
        if !logged_in?
            @errors = ["Please login first."]
            redirect_to login_path
        end
    end
    
end
