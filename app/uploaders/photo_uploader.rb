class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process :convert => 'jpg'

  process :resize_to_fill => [500, 666]


end
