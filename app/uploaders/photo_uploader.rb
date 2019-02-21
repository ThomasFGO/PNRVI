class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  #process :convert => 'png'

  process :resize_to_fill => [400, nil]


end
