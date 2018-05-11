require 'pry'
class Movie < ActiveRecord::Base
  
  belongs_to :user
  
  def slug
    
    # what keyword represents the particular instance we're calling #slug on??
    self.name.downcase.gsub(" ","-")
  end
  
  def self.find_by_slug(slug)
    
    all.find { |movie| movie.slug == slug }
    
  end
  
  

end
