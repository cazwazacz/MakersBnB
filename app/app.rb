ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'carrierwave'
require './app/data_mapper_setup'

CarrierWave.configure do |config|
  config.root = File.dirname(__FILE__) + "/public"
end

# CarrierWave.configure do |config|
#   config.root = "/app/public/uploads"
# end

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    space = Space.create(
      title: params[:title],
      description: params[:description],
      price: params[:price].to_i
    )

    space.save

    img = Photo.create(
      image: params[:image]
    )

    img.save

    space.photos << img

    space.save

    redirect '/spaces'
  end

  post '/spaces/:id/update_availability' do
    space = Space.get(params[:id])
    space.toggle_availability
  end

  get '/spaces' do
    @spaces = Space.all
    @photos = Photo.all
    erb :'spaces/index'
  end

  # post '/save_photo' do
  #   img = Photo.new
  #   img.file = params[:file]
  #   img.description = 'This is the caption'
  #   img.save!
  #   space.photos << img
  #   space.save
  #   redirect 'spaces/index'
  # end

  run! if app_file == $PROGRAM_NAME
end
