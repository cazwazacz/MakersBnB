class Space
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :description, Text
  property :price, Integer
  property :available?, Boolean, :default => true

  has n, :photos
  has n, :bookings
  belongs_to :user

  def toggle_availability
    self.update(available: !self.available?)
  end
end
