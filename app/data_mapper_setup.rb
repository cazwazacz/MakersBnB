require 'data_mapper'
require 'dm-postgres-adapter'
require './app/models/space'

DataMapper.setup(:default, 'postgres://localhost/nightmairbnb_test')
DataMapper.finalize
DataMapper.auto_upgrade!
