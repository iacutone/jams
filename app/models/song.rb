require 'rubygems'
require 'grooveshark'
require 'pry'

class Song < ActiveRecord::Base
  attr_accessible :album, :artist, :duration, :name, :url
	
end

# include PgSearch

#   pg_search_scope :search, against: [:restaurant_name], 
#   	using: {tsearch: {dictionary: "english"}}


#   def self.text_search(query)
# 	  if query.present?
# 	    search(query)
# 	  else
# 	    scoped
# 	  end
# 	end
# end
