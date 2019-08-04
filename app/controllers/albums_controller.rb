class AlbumsController < ApplicationController

    before_action :set_album, only: [:show, :edit, :update, :destroy]
    
    def index
    end
    
    def show
    end
    
    def new
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
    
    def set_album
        @album = Album.find(params[:id])
    end
    
    def album_params
        params.require(:album).permit(:name, :description, :user_id)
    end
end
