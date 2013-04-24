require 'rubygems'
require 'grooveshark'
require 'pry'

class Song < ActiveRecord::Base
  attr_accessible :album, :artist, :duration, :name, :url
	
end

