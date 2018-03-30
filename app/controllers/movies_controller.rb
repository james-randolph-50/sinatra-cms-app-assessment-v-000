class MoviesController < ApplicationController
  
  get '/movies' do
    @movies = Movie.all
    erb :'/movies/index'
  end
  
  get '/movies/new' do
    erb :'/movies/new'
  end