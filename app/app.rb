ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/data_mapper_setup'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    Space.create(
      title: params[:title],
      description: params[:description],
      price: params[:price].to_i
    )
    redirect '/spaces'
  end

  post '/spaces/:id/update_availability' do
    space = Space.get(params[:id])
    space.toggle_availability
  end

  get '/spaces' do
    @spaces = Space.all
    erb :'spaces/index'
  end

  run! if app_file == $PROGRAM_NAME
end
