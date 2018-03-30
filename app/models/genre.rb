class Genre < ActiveRecord::Base
  has_many :movies
  
  def slug
    name.downcase.gsub(" ","-")
  end
  
  def self.find_by_slug(slug)
    Genre.all.find{|genre| genre.slug == slug}
  end
  
  
end
