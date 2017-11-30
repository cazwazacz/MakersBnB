class Booking
  include DataMapper::Resource

  property :id, Serial
  property :booking_status, String, :default  => "requested"

  belongs_to :space
  belongs_to :user

end
