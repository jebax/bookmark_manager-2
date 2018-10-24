require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :method_override

  get '/' do
    erb :index
  end

  post '/' do
    Bookmark.create(params[:title], params[:url])
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(params[:id])
    redirect '/bookmarks'
  end

  run! if app_file == $PROGRAM_NAME
end
