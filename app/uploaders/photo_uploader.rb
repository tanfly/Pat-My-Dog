class PhotoUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave

  version :thumbnail do
    eager
    resize_to_fit(150, 150)
    cloudinary_transformation :quality => 80,        
    :angle=> "ignore" 
  end  

  version :profile_size do
    eager
    resize_to_fit(400, 400)
    cloudinary_transformation :quality => 80,   
    :angle=> "ignore"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

end
