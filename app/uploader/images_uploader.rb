class ImagesUploader < CarrierWave::Uploader::Base
  # include CarrierWave::MiniMagick
  storage :file
end
