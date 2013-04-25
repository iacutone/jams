require 'grooveshark'
require 'pry'

class SongsController < ApplicationController

	def search
      begin
   	  client = Grooveshark::Client.new
      rescue
        client = Grooveshark::Client.new
      end
   	session = client.session
   	@songs = client.search_songs(params[:query])
      @song = @songs.first
      @url = client.get_song_url(@song)
   end

   def show
      
   end

	def play
      # @songs.each do |s|
      #   s.id          # Song ID
      #   s.name        # Song name
      #   s.artist      # Song artist name
      #   s.album       # Song album name
      #   s.duration    # Song duration in seconds (not always present, 0 by default)
      # end
      
      test = @songs

      # url = client.get_song_url(song)
	end

end
