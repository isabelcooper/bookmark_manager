require 'sinatra/base'

class BookMarkApp < Sinatra::Base

  get '/' do
    erb :index
  end

end
