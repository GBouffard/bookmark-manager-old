require 'sinatra/base'
require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

class BookmarkManager3 < Sinatra::Base
  get '/' do
  @links = Link2.all
  erb :index
end
end

# we're telling datamapper to use a postgres database on localhost. The name will be "bookmark_manager_test" or "bookmark_manager_development" depending on the environment

DataMapper.setup(:default, "postgres://localhost/bookmark_manager3_#{env}")

require './lib/link2' # this needs to be done after datamapper is initialised

# After declaring your models, you should finalise them

DataMapper.finalize

# However, the database tables don't exist yet. Let's tell datamapper to create them

DataMapper.auto_upgrade!
