require 'sinatra/base'
require './lib/bookmark'
class BookmarkManager < Sinatra::Base
  get '/' do
    erb(:index)
  end

  post '/' do
    Bookmark.create(params[:title], params[:url])
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:bookmarks)
  end

  run! if app_file == $PROGRAM_NAME
end
