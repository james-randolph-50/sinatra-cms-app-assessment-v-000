require 'pry'
class Movie < ActiveRecord::Base
  
  belongs_to :user
  
  def slug
    name.downcase.gsub(" ","-")
  end
  
  def self.find_by_slug(slug)
   
    Movie.all.find{|movie| movie.name.downcase == slug}
  end
  
  
  
end
