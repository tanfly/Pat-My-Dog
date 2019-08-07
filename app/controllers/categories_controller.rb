class CategoriesController < ApplicationController
    before_action :require_login, only: [:new, :create, :edit, :destroy]

    before_action :set_category, only: [:show, :edit, :update, :destroy]

    def index
        @categories = Category.all
    end

    def show
        @photos = []
        @category.photo_ids.each do |photo_id| 
           @photos << Photo.find_by(id: photo_id)
        end
    end

    def new
        @category = Category.new
    end

    def create
        category = Category.new(category_params)
        if category.save
            redirect_to category_path(category)
        else
            flash[:alert] = "Please make sure all form areas are filled out."
            redirect_to new_category_path
        end
    end

    def edit
    end

    def update
        @category.update(category_params)
        redirect_to category_path(@category)
    end

    def destroy
        @category.destroy
        redirect_to category_path
    end

    private

    def require_login
        authorized?
    end

    def set_category
        @category = Category.find(params[:id])
    end

    def categories_params
        params.require(:category).permit(:name, photo_ids:[])
    end
end
