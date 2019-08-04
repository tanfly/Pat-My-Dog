class PhotosController < ApplicationController
    mount_uploader :image, ImageUploader
    before_action :set_photo, only: [:show, :edit, :update, :destroy]
    
    def index
    end
    
    def show
    end
    
    def new
        @photo = Photo.new
    end
    
    def create
    end
    
    def edit
    end
    
    def update
    end
    
    def destroy
    end
    
    private
    
    def set_photo
        @photo = Photo.find(params[:id])
    end
    
    def photo_params
        params.require(:photo).permit(:desription, :pat_count, :user_id, :album_id, category_ids:[], categories_attributes: [:name])
    end
end
