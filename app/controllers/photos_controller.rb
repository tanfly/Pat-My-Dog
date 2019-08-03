class PhotosController < ApplicationController
    mount_uploader :image, ImageUploader

    def new
        @photo = Photo.new
    end

    def create
        
    end
end
