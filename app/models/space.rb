class Space
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :description, Text
  property :price, Integer
  property :available?, Boolean, :default => true

  has n, :photos, through: Resource

  def toggle_availability
    self.update(available: !self.available?)
  end
end
