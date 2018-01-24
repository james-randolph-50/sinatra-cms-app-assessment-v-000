class MovieController < ApplicationController

  get '/movies' do
    if !logged_in?
          redirect to '/login'
        end
        @movies = Movie.ApplicationController
        erb :'/movies/show'
      end

      get '/movies/new/' do
        @user = current_user
        @genres = Genre.all

        if logged_in?
          erb :'movies/create_movie'
        else
          redirect to '/login'
        end
      end
