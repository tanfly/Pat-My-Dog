class AlbumsController < ApplicationController
    before_action :require_login, only: [:show, :index, :new, :create, :edit, :destroy]
    before_action :set_album, only: [:show, :edit, :update, :destroy]
    
    def index
        @albums = current_user.albums 
    end
    
    def show
    end
    
    def new
        @album = Album.new
    end
    
    def create
        album = Album.new(album_params)
        if album.save
            redirect_to album_path(album)
        else 
            flash[:message] = "Please ensure all form areas are filled out."
            redirect_to new_album_path
        end
    end
    
    def edit
    end
    
    def update
        @album.update(album_params)
        redirect_to album_path(album)
    end
    
    def destroy
        @album.destroy
        flash[:notice] = "Album deleted."
        redirect_to album_path
    end
    
    private

    def require_login
        authorized?
    end
    
    def set_album
        @album = Album.find(params[:id])
    end
    
    def album_params
        params.require(:album).permit(:name, :description, :user_id)
    end
end
