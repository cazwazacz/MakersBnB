class Photo

  include DataMapper::Resource

  property :id, Serial
  property :image, String, :auto_validation => false
  mount_uploader :image, ImagesUploader

  has n, :spaces, through: Resource

end
