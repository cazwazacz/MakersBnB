ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require './app/data_mapper_setup'

class App < Sinatra::Base
  enable :sessions
  set :session_secret, 'something'
  register Sinatra::Flash
  use Rack::MethodOverride

  helpers do
    def current_user
      @current_user = User.get(session[:user_id])
    end
  end


  get '/' do
    erb :index
  end

  get '/spaces/new' do
    if current_user
      erb :'spaces/new'
    else
      redirect '/sessions/new'
    end
  end

  post '/spaces' do
    user = User.get(session[:user_id])
    space = Space.new(
      title: params[:title],
      description: params[:description],
      price: params[:price].to_i,
      location: params[:location],
      image_url: params[:image_url]
    )
    user.spaces << space
    user.save!
    redirect '/spaces'
  end

  post '/spaces/:id/request_booking' do
    space = Space.get(params[:id])
    space.toggle_availability
    booking = Booking.create
    space.bookings << booking
    space.save!
    user = User.get(session[:user_id])
    user.bookings << booking
    user.save!
    200
  end

  get '/spaces' do
    if current_user
      @spaces = Space.all
      erb :'spaces/index'
    else
      redirect '/sessions/new'
    end
  end


  get '/api/spaces' do
    content_type :json
    { info: Space.all }.to_json
  end

  get '/users/new' do
    erb :'users/new'
  end

  get '/users/:id' do
    user = User.get(session[:user_id])
    erb :'users/my_dashboard'
  end

  get '/api/users/:id' do
    content_type :json
    user = User.get(params[:id])
    { spaces: user.spaces, bookings: user.bookings, requests: user.spaces.map(&:bookings) }.to_json
  end

  post '/users' do
    @new_user = User.create(
      name: params[:name],
      email: params[:email],
      username: params[:username],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if @new_user.save
      session[:user_id] = @new_user.id
      redirect '/'
    else
      @new_user.errors.each do |error|
        flash.next[:error] = error[0]
      end
    end
    redirect '/users/new'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    @user = User.first(username: params[:username])
    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect '/'
    else
      flash[:error] = 'Username or password is not correct'
      redirect '/sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.next[:goodbye] = 'Sorry to see you leave :( '\
    'Please come back soon. '\
    'We miss you. '\
    'Please.'
    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME
end
