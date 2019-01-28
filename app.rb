require 'sinatra/base'
require_relative './lib/bookmark'

class BookMarkApp < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    bookmark = BookMark.new
    @bookmarks = bookmark.all
    puts @bookmarks
    erb :bookmarks
  end

end
