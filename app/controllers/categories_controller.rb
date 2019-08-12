class CategoriesController < ApplicationController
    before_action :require_login, only: [:new, :create, :edit, :destroy]

    before_action :set_category, only: [:show, :edit, :update, :destroy]

    def index
        @categories = Category.all
    end

    def show
        @photos = @category.photos
    end

    def edit
    end

    def update
        @category.update(category_params)
        redirect_to category_path(@category)
    end

    private

    def require_login
        if !logged_in?
            @errors = ["Please login first."]
            redirect_to login_path
        end
    end

    def set_category
        @category = Category.find(params[:id])
    end

    def category_params
        params.require(:category).permit(:name, photo_ids:[])
    end
end
