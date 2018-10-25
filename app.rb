require 'sinatra/base'
require './lib/bookmark'
require './database_connection_setup'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  post '/' do
    if params[:url] =~ /\A#{URI::regexp(['http', 'https'])}\z/
      Bookmark.create(params[:title], params[:url])
      redirect '/bookmarks'
    else
      flash[:warning] = 'Please enter a valid URL!'
      redirect '/'
    end
  end
  
  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.all.select{ |bookmark| bookmark.id == params[:id] }.first
    erb :edit
  end

  patch '/bookmarks/:id/edit' do
    Bookmark.update(params[:id], params[:title], params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $PROGRAM_NAME
end
