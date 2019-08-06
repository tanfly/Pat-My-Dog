class PhotosController < ApplicationController
    before_action :require_login, only: [:show, :index, :new, :create, :edit, :destroy]
    before_action :set_photo, only: [:show, :edit, :update, :destroy]
    
    def index
        @user = User.find_by(id: params[:user_id])
        @photos = @user.photos
    end
    
    def show
    end
    
    def new
        @user = User.find_by_id(params[:id])
        @photo = Photo.new
    end
    
    def create
        @photo = Photo.new(photo_params)
        @photo.user_id = params[:user_id]
            if @photo.save
                redirect_to user_photo_path(@photo.user, @photo)
            else
                flash[:error] = "Please ensure all areas are filled out correctly."
                redirect_to new_user_photo_path(@photo.user)
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
        params.require(:photo).permit(:desription, :pat_count, :user_id, :album_id, category_ids:[], categories_attributes: [:name])
    end

    def require_login
        authorized?
    end
end
