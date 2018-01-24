class MovieController < ApplicationController

  get '/movies' do
    if !logged_in?
          redirect to '/login'
        end
        @movies = Movie.ApplicationController
        erb :'/movies/show'
      end
