require 'pry'
class Movie < ActiveRecord::Base
  
  belongs_to :user

  validates :name, presence: true
  validates :name, uniqueness: true
  
  
  def slug
    name.downcase.gsub(" ","-")
  end
  
  def self.find_by_slug(slug)
    
    all.find { |movie| movie.slug == slug }
    
  end
  
  

end
