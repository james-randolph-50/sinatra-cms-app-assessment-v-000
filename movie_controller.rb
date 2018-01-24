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

      post '/movies' do
        @movie = Movie.create(params)
        if @movie.save
          redirect to '/movies.#{@movie.slug}'
        else
          redirect to 'movies/new'
        end
      end

      get '/movies/:slug/edit' do
        if logged_in?
          if @movie = current_user.movies.find_by_slug(params[:slug])
            erb :'books/edit'
          else
      end
      