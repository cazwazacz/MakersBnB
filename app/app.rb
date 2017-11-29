ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/data_mapper_setup'

class App < Sinatra::Base
  enable :sessions
  set :session_secret, 'something'

  helpers do
    def current_user
      @current_user = User.get(session[:user_id])
    end
  end


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
    space.bookings << Booking.create
    space.save
    200
  end

  get '/spaces' do
    @spaces = Space.all
    erb :'spaces/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @new_user = User.new(name: params[:name], email: params[:email], username: params[:username])
    @new_user.password = params[:password]
    @new_user.save!
    session[:user_id] = @new_user.id
    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME
end
