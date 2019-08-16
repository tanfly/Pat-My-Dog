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

    ids = photos.collect do |photo|
      photo.id
    end

    p = Pat.group(:photo_id).count

    valid_ids = p.reject!{|id| !ids.include?(id)}

    if valid_ids
    sorted_photo_pats = valid_ids.sort_by{|k, v| v}.reverse
    else
      sorted_photo_pats = p.sort_by{|k, v| v}.reverse
    end

    photo_ids_pats = sorted_photo_pats.collect do |photo_id, pat_count|
      photo_id
    end

    photos_w_zero = photos.reject{|photo| photo_ids_pats.include?(photo.id)}
    
    photo_ids_zero = photos_w_zero.collect do |photo|
      photo.id 
    end

    all_photo_ids = photo_ids_pats + photo_ids_zero

    @photos = all_photo_ids.collect do |id|
      Photo.find(id)
    end

  end


  def low_to_high(photos)

    ids = photos.collect do |photo|
      photo.id
    end

    p = Pat.group(:photo_id).count

    valid_ids = p.reject!{|id| !ids.include?(id)}

    if valid_ids
      sorted_photo_pats = valid_ids.sort_by{|k, v| v}
    else
        sorted_photo_pats = p.sort_by{|k, v| v}
    end

    photo_ids_pats = sorted_photo_pats.collect do |photo_id, pat_count|
      photo_id
    end

    photos_w_zero = photos.reject{|photo| photo_ids_pats.include?(photo.id)}
                
    photo_ids_zero = photos_w_zero.collect do |photo|
      photo.id 
    end
    
    all_photo_ids = photo_ids_zero + photo_ids_pats

    @photos = all_photo_ids.collect do |id|
      Photo.find(id)
    end

  end


end
