require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkApp < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  get '/add_bookmark' do
    erb :add_bookmark
  end

  post '/store_bookmark' do
    Bookmark.create(params[:url])
    redirect '/bookmarks'
  end

end
