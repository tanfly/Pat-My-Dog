class PhotoUploader < CarrierWave::Uploader::Base
  
  include Cloudinary::CarrierWave

  
  version :tiny do 
    process :resize_to_fill => [20, 20]
  end

  version :profile_size do
    process :resize_to_fill => [300, 300]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

end
