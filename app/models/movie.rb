require 'pry'
class Movie < ActiveRecord::Base
  
  belongs_to :user
  
  def slug
    
    Movie.name.downcase.gsub(" ","-")
  end
  
  def self.find_by_slug(slug)
    
    Movie.all.find do |movie|
      if movie.name 
      
      movie.name.downcase == slug
     end
    end
  end
  
  
  
end
