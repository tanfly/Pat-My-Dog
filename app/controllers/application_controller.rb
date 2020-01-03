class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    helper_method :current_user, :logged_in?, :current_profile, :user_sort, :high_to_low, :low_to_high

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_profile
    current_user.profile
  end

  def logged_in?
    !!current_user
  end

  def user_sort(photos)
    @photos = photos.order(:profile_id)
  end

  def high_to_low(photos)
   @photos = photos.sort_by{|photo| photo.pats.count}.reverse
  end


  def low_to_high(photos)
    @photos = photos.sort_by{|photo| photo.pats.count}
  end


end
