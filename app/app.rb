require 'sinatra/base'
require './app/models/space'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    redirect '/spaces'
  end

  get '/spaces' do
    'Spaces'
  end

  run! if app_file == $PROGRAM_NAME

end
