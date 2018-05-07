require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  enable :sessions

    configure do
      set :public_folder, 'public'
      set :views, 'app/views'
      set :session_secret, "secret"
    end
    
    
    helpers do
      
      def logged_in?
        !!current_user
      end
      
      def redirect_if_not_logged_in
        if !logged_in?
          redirect "/login?error=You need to login first."
        end
      end
      
      
      def current_user
        
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
        
      end

    get "/" do
        erb :index
    end
    
    patch '/movies/' do
       erb :index
    end
  end
end


