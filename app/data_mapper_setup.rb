require 'data_mapper'
require 'dm-postgres-adapter'
require 'carrierwave/datamapper'
require './app/uploader/images_uploader'
require './app/models/space'
require './app/models/photo'
require './app/models/booking'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/nightmairbnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
