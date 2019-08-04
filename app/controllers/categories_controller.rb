class CategoriesController < ApplicationController

    before_action :set_category, only: [:show, :edit, :update, :destroy]

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

    def set_category
        @category = Category.find(params[:id])
    end

    def categories_params
        params.require(:category).permit(:name, photo_ids:[])
    end
end
