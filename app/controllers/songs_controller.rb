require 'rubygems'
require 'grooveshark'
require 'pry'

class SongsController < ApplicationController

	def search
   	client = Grooveshark::Client.new
   	session = client.session
   	@songs = client.search_songs(params[:query])
   
   
   	@songs.each do |s|
   	  s.id          # Song ID
   	  s.name        # Song name
   	  s.artist      # Song artist name
   	  s.album       # Song album name
   	  s.duration    # Song duration in seconds (not always present, 0 by default)
   
   	end
   
   	song = @songs.first
   	url = client.get_song_url(song)
  	binding.pry
   end

	

	def play
		# link_to url
	end

end
