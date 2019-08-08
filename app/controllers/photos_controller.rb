class PhotosController < ApplicationController
    before_action :require_login, only: [:show, :index, :new, :create, :edit, :destroy]
    before_action :set_photo, only: [:show, :edit, :update, :destroy]
    
    def index
        @user = User.find(params[:user_id])
        @photos = User.find(params[:user_id]).photos
    end
    
    def show
        @photo = Photo.find(params[:id])
        @user = User.find(params[:user_id])
        @pats = @photo.pats
    end
    
    def new
        @user = User.find(params[:user_id])
        @photo = Photo.new
        @photo.categories.build
    end
    
    def create
        @photo = Photo.new(photo_params)
        @photo.user_id = params[:photo][:user_id]
            if @photo.save
                redirect_to user_photo_path(@photo.user_id, @photo.id)
            else
                flash[:error] = "Please ensure all areas are filled out correctly."
                redirect_to new_user_photo_path(@user)
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
        params.require(:photo).permit(:image, :description, :user_id, :album_id, category_ids:[], categories_attributes: [:name])
    end

    def require_login
        if !logged_in?
            flash[:error] = "You are not logged in"
            redirect_to login_path
        end
    end
end
