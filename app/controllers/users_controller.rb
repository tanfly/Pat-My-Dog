class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def show
        if current_user
            render :show
        else
            redirect_to root_path
        end
    end

    def new
        @user = User.new
    end

    def create
        binding.pry

        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id 
            redirect_to user_path(user)
        else
            flash[:message] = "Please ensure all form areas are filled correctly"
            redirect_to new_user_path
        end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def set_user
        @user = User.find(params[:id])
      end

    def user_params
        params.require(:user).permit(:name, :username, :password_digest, :email, :last_login, :member_since, :age, :location, :file)
    end
end
