class CommentsController < ApplicationController
    before_action :require_login, only: [:show, :index, :new, :create, :edit, :destroy]
    before_action :set_comment, only: [:edit, :update, :destroy]


    def create
        @comment = Comment.new(comment_params)
        if @comment.save
            redirect_to request.referer
        else
            redirect_to request.referer
        end
    end

    def edit
    end

    def update
        @comment.update(comment_params)
        redirect_to photo_path(@comment.photo_id)
    end

    def destroy
        @comment.destroy
        redirect_to request.referrer
    end

    private

    def require_login
        if !logged_in?
            @errors = ["Please login first."]
            redirect_to login_path
        end
    end

    def set_comment
        @comment = Comment.find(params[:id])
    end

    def comment_params
        params.require(:comment).permit(:content, :user_id, :photo_id)
    end
end
