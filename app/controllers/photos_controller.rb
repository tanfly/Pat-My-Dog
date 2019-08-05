class PhotosController < ApplicationController
    mount_uploader :image, ImageUploader
    before_action :set_photo, only: [:show, :edit, :update, :destroy]
    
    
    def show
    end
    
    def new
        @photo = Photo.new
    end
    
    def create
        photo = Photo.new(photo_params)
        if photo.save
            redirect_to photo_path(photo)
        else
            flash[:alert] = "Please make sure all form areas are filled out."
            redirect_to new_photo_path
    end
    
    def edit
    end
    
    def update
        @photo.update(photo_params)
        redirect_to photo_path(@photo)
    end
    
    def destroy
        @photo.destroy
        flash[:notice] = "Photo deleted."
        redirect_to user_path(current_user)
    end
    
    private
    
    def set_photo
        @photo = Photo.find(params[:id])
    end
    
    def photo_params
        params.require(:photo).permit(:desription, :pat_count, :user_id, :album_id, category_ids:[], categories_attributes: [:name])
    end
end
