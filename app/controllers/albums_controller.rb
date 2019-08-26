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
    end
    
    def create
        @profile = current_profile
        @album = Album.new(album_params)
        if @album.save
            redirect_to profile_album_path(@profile, @album)
        else 
            render :new
        end
    end
    
    def edit
        @profile = current_profile
    end
    
    def update
        @album.update(album_params)
        if params[:delete_ids].any?
            @album
        redirect_to album_path(@album)
        end
    end
    
    def destroy
        @album.destroy
        redirect_to profile_albums_path(current_profile)
    end
    
    private

    def require_login
        if !logged_in?
            redirect_to login_path
        end
    end
    
    def set_album
        @album = Album.find(params[:id])
    end
    
    def album_params
        params.require(:album).permit(:name, :description, :profile_id, photo_ids:[], delete_ids:[])
    end
end
