require 'sinatra/base'

class BookMarkApp < Sinatra::Base

  get '/' do
    'Hello World'
  end
  
end
