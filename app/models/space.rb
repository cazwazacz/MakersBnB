require 'data_mapper'
require 'dm-postgres-adapter'

class Space
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :description, Text
  property :price, Integer
end

DataMapper.setup(:default, 'postgres://localhost/nightmairbnb_test')

DataMapper.finalize

DataMapper.auto_upgrade!
