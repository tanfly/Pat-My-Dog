class AlbumsController < ApplicationController
    before_action :require_login, only: [:show, :index, :new, :create, :edit, :destroy]
    before_action :set_album, only: [:show, :edit, :update, :destroy]
    
    def index
        @profile = Profile.find(params[:profile_id])
        @albums =  @profile.albums
    end
    
    def show
        @profile = @album.profile
    end
    
    def new
        @album = Album.new
        @profile = current_profile
        @photos = current_profile.photos.where("album_id is null")
    end
    
    def create
        @album = Album.new(album_params)
        if @album.save
            redirect_to album_path(@album)
        else 
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
        if !logged_in?
            flash[:error] = "You are not logged in"
            redirect_to login_path
        end
    end
    
    def set_album
        @album = Album.find(params[:id])
    end
    
    def album_params
        params.require(:album).permit(:name, :description, :profile_id, photo_ids:[])
    end
end
