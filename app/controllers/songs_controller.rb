require 'grooveshark'
require 'pry'

class SongsController < ApplicationController

   def new 
      @song = Song.new
   end

   def create 
      @song = Song.new
   end

	def search
      begin
   	  client = Grooveshark::Client.new
      rescue
        client = Grooveshark::Client.new
      end

   	client.session

   	@songs = client.search_songs(params[:query])
      @song = @songs.first
      @url = client.get_song_url(@song)

      @song_for_array = @songs.first.to_s
      song = @song_for_array.split(' - ')

      @save_song = Song.new
      @save_song[:id] = song[0] unless Song.where(:id => @save_song.id).present?
      @save_song[:name] = song[1] unless Song.where(:name => song[1]).present?
      @save_song[:artist] = song[2] unless Song.where(:artist => song[2]).present?
      @save_song[:url] = @url unless Song.where(:url => @save_song.url).present?

      @save_song.save

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
      
      # test = @songs

      # url = client.get_song_url(song)
	end

end
