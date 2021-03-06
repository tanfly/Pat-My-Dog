class UsersController < ApplicationController
  before_action :require_login, only: [:show, :index, :edit, :destroy]
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
      render :layout => 'signup'
  end

  def create
      @user = User.new(user_params)
      if @user.save
          session[:user_id] = @user.id
          redirect_to user_path(@user)
      else
          render :new, :layout => 'signup'
      end
  end

  def edit
  end

  def update
      @user.update(user_params)
      redirect_to user_path(@user)
  end

  def destroy
  end

  private

  def require_login
      if !logged_in?
          redirect_to login_path
      end
  end

  def set_user
      @user = User.find(params[:id])
  end

  def user_params
      params.require(:user).permit(:avatar, :remote_image_url, :name, :username, :password, :email, :last_login, :member_since, :age, :location)
  end
end