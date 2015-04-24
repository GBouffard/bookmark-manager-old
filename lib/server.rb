require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'
require './lib/link2'
require './lib/tag2'
require './lib/user2'

env = ENV['RACK_ENV'] || 'development'

class BookmarkManager3 < Sinatra::Base

helpers do

  def current_user
    @current_user ||= User2.get(session[:user_id]) if session[:user_id]
  end

end
  enable :sessions
  use Rack::Flash
  use Rack::MethodOverride
  set :session_secret, 'super secret'

  get '/' do
  @links = Link2.all
  erb :index
  end

  post '/links' do
    url = params['url']
    title = params['title']
     tag2s = params['tags'].split(' ').map do |tag|
     Tag2.first_or_create(text: tag)
     end
  Link2.create(url: url, title: title, tag2s: tag2s)
  redirect to('/')
  end

  get '/tags/:text' do
    tag = Tag2.first(text: params[:text])
    @links = tag ? tag.link2s : []
    erb :index
  end

get '/users/new' do
  @user = User2.new
  erb :'users/new'
end

post '/users' do
  @user = User2.new(email: params[:email],
                  password: params[:password],
                  password_confirmation: params[:password_confirmation])
if @user.save
    session[:user_id] = @user.id
    redirect to('/')
  else
    flash[:notice] = 'Sorry, your passwords do not match'
    erb :'users/new'
  end
end
end
DataMapper.setup(:default, "postgres://localhost/bookmark_manager3_#{env}")

DataMapper.finalize

DataMapper.auto_upgrade!
