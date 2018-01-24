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
            erb :'movies/edit'
          else
            redirect to '/movies'
          end
        else
          redirect to '/login'
        end
      end

      patch '/movies/:slug/edit' do
        if logged_in?
          if @movie = current_user.movies.find_by_slug(params[:slug])
            @movie.update(params[:movie])
            redirect to '/movies/#{@movie.slug}'
          else
            redirect to '/movies'
          end
        else
          redirect to '/login'
        end
      end

      get '/movies/:slug' do
        @user = current_user
        @movie - Movie.find_by_slug(params[:slug])
        if logged_in?
          erb :'movies/show_movie'
        else
          redirect to '/login'
        end
      end

      get '/movies/users/:slug' do
        @user = User.find_by_slug(params[:slug])
        @movies = []

        Movie.all.each do |m|
          if m.user == @user
            @movies << m
          end
          erb :'users/show'
        end

        delete '/movies/:slug/delete' do
          @user = current_user
          @movie = Movie.find_by_slug(params[:slug])
          @movie.destroy
          redirect to 'movies/users/#{@user.slug}'
      end
