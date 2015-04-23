require 'sinatra/base'
require 'data_mapper'
require './lib/link2'
require './lib/tag2'

env = ENV['RACK_ENV'] || 'development'

class BookmarkManager3 < Sinatra::Base
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
end

DataMapper.setup(:default, "postgres://localhost/bookmark_manager3_#{env}")

DataMapper.finalize

DataMapper.auto_upgrade!
