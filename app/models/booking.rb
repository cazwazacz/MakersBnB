class Booking
  include DataMapper::Resource

  property :id, Serial

  belongs_to :space

end
