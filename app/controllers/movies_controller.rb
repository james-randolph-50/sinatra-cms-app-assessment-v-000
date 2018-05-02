require 'pry'

class MoviesController < ApplicationController
  
  get '/movies' do
   
   redirect_if_not_logged_in
    @movies = Movie.all
    
    erb :'/movies/index'
  end
  
  get '/movies/new' do
    redirect_if_not_logged_in
    erb :'/movies/new'
  end
  
  get '/movies/:slug' do
    redirect_if_not_logged_in
    @movie = Movie.find_by_slug(params[:slug])
    
    erb :'movies/show'
  end
  
  post '/movies' do
    redirect_if_not_logged_in
    @movie = Movie.create(:name => params["Movie_Name"], :user_id => params[:id])
    @movie.save
    
    redirect("/movies/#{@movie.slug}")
  end
  
  get "/movies/:id/edit" do
    redirect_if_not_logged_in
    @movie = Movie.find(params[:id])
    unless Movie.valid_params?(params)
      redirect "/movies/#{@movie.id}/edit?error=invalid movie"
    end
    @movie.update(params.select{|m| m=="name"})
    redirect "/movies/#{@movie.id}"
  end
    
  
end