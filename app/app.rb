require 'sinatra/base'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  run! if app_file == $PROGRAM_NAME
end
