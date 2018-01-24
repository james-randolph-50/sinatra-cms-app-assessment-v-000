require './config/environment'

class ApplicationController < Sinatra::Base

    configure do
      set :public_folder, 'public'
      set :views, 'app/views'
      set :session_secret, "secret"
    end

    get "/" do
        @genres = Genre.ApplicationController
        erb :welcome
    end
