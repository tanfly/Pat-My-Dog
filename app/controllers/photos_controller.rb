class PhotosController < ApplicationController
    before_action :require_login, only: [:show, :index, :new, :create, :edit, :destroy]
    before_action :set_photo, only: [:show, :edit, :update, :destroy]
    
    def index
        if params[:profile_id]
            profile = Profile.find(params[:profile_id])
            @photos = profile.photos
        elsif
            if params[:sort_order] == "user_sort"
                @photos = Photo.order(:profile_id)
            elsif params[:sort_order] == "high_to_low"
                photos = Photo.all
                p = Pat.group(:photo_id).count
                sorted_photo_pats = p.sort_by{|k, v| v}.reverse
                photo_ids_pats = sorted_photo_pats.collect do |photo_id, pat_count|
                    photo_id
                end
                photos_w_zero = photos.reject{|photo| photo_ids_pats.include?(photo.id)}
                photo_ids_zero = photos_w_zero.collect do |photo|
                    photo.id 
                end
                all_photo_ids = photo_ids_pats + photo_ids_zero
                @photos = all_photo_ids.collect do |id|
                    Photo.find(id)
                end
            elsif params[:sort_order] == "low_to_high"
                photos = Photo.all
                p = Pat.group(:photo_id).count
                sorted_photo_pats = p.sort_by{|k, v| v}
                photo_ids_pats = sorted_photo_pats.collect do |photo_id, pat_count|
                    photo_id
                end
                photos_w_zero = photos.reject{|photo| photo_ids_pats.include?(photo.id)}
                photo_ids_zero = photos_w_zero.collect do |photo|
                    photo.id 
                end
                all_photo_ids = photo_ids_zero + photo_ids_pats
                @photos = all_photo_ids.collect do |id|
                    Photo.find(id)
                end
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
