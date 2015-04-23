require 'sinatra/base'
require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

class BookmarkManager3 < Sinatra::Base
  get '/' do
  @links = Link2.all
  erb :index
  end

  post '/links' do
    url = params['url']
    title = params['title']
    Link2.create(url: url, title: title)
    redirect to('/')
  end
end

DataMapper.setup(:default, "postgres://localhost/bookmark_manager3_#{env}")

require './lib/link2'

DataMapper.finalize

DataMapper.auto_upgrade!
