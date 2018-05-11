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
  
 get "/movies/:id/edit" do

    redirect_if_not_logged_in 
    @error_message = params[:error]
    
    if session[:user_id]
      @movie = Movie.find_by_slug(params[:id])
      erb :'movies/edit'
    else
      redirect to '/login'
    end
    
  end
  
  get '/movies/:slug' do
    redirect_if_not_logged_in
    @movie = Movie.find_by_slug(params[:slug])
    erb :'movies/show'
  end
  
  post '/movies' do
    redirect_if_not_logged_in
    
    # let's build a Movie instance but don't save it yet 
    # using the params that are passed in
    # @movie = Movie.new(:name => params["Movie_Name"])
    # if the @movie is valid  (the movie already exists) 
      # do "movie exists stuff"
   # else 
      # commit to the database
   # end 
   
   # @movie = Movie.create(:name => params["Movie_Name"])
    #Validation for movie
   # @movie.save
   # redirect("/movies/#{@movie.slug}")
  end
  
  delete '/movies/:slug' do
    @movie = Movie.delete(params[:slug])
    redirect to("/")
  end
  
  
end