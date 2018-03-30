class GenreController < ApplicationController

  get '/genres' do
    if !logged_in?
          redirect to '/login'
        end
        @genres = Genre.ApplicationController
        erb :'/genres/show'
      end

      get '/genres/new/' do
        @user = current_user
        @genres = Genre.all

        if logged_in?
          erb :'genres/create_genre'
        else
          redirect to '/login'
        end
      end

      post '/genres' do
        @genre = Genre.create(params)
        if @genre.save
          redirect to '/genres.#{@genre.slug}'
        else
          redirect to 'genres/new'
        end
      end

      get '/genres/:slug/edit' do
        if logged_in?
          if @movie = current_user.genres.find_by_slug(params[:slug])
            erb :'genres/edit'
          else
            redirect to '/genres'
          end
        else
          redirect to '/login'
        end
      end

      patch '/genres/:slug/edit' do
        if logged_in?
          if @genre = current_user.genres.find_by_slug(params[:slug])
            @genre.update(params[:genre])
            redirect to '/genres/#{@genre.slug}'
          else
            redirect to '/genres'
          end
        else
          redirect to '/login'
        end
      end

      get '/genres/:slug' do
        @user = current_user
        @genre - Genre.find_by_slug(params[:slug])
        if logged_in?
          erb :'genres/show_genre'
        else
          redirect to '/login'
        end
      end

      get '/genres/users/:slug' do
        @user = User.find_by_slug(params[:slug])
        @genres = []

        Genre.all.each do |g|
          if m.user == @user
            @genres << g
          end
          erb :'users/show'
        end
      end

        delete '/genres/:slug/delete' do
          @user = current_user
          @genre = Genre.find_by_slug(params[:slug])
          @genre.destroy
          redirect to 'genres/users/#{@user.slug}'
      end
    end
