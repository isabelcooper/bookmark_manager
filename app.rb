require 'sinatra/base'
require_relative './lib/database_connection'
require_relative './lib/bookmark'
require_relative 'database_connection_setup'
require 'uri'
require 'sinatra/flash'



class BookmarkApp < Sinatra::Base

  enable :method_override
  enable :sessions
  register Sinatra::Flash
#  disable :show_exceptions

  setup

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  get '/bookmarks/add' do
    erb :add_bookmark
  end

  post '/bookmarks' do
    flash[:notice] = "Please enter a valid url" unless Bookmark.create(params[:title],params[:url])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :update_bookmark
  end

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

end
