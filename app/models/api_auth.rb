require 'grooveshark'
require 'pry'

class ApiAuth < ActiveRecord::Base

  @@session_key = 0
  @@client = "unassigned"

  def self.s_key
    @@session_key
  end

  def self.client
    @@client
  end

  # def self.client=(new_client)
  #   @@client = new_client
  # end

  def self.client_call(artist_search)
    begin
      ApiAuth.client.search_songs(artist_search)
    rescue
      sleep 4
      re_up_token
      client_call(artist_search)
    end
  end

  def self.re_up_token
    # reset_key
    @@client = Grooveshark::Client.new(ApiAuth.s_key)

    puts "----------"
    puts "Made a new token, #{ApiAuth.client}"
  end

  # def self.reset_key
  #   @@session_key = 0
  # end
  def self.get_and_add_url_param(song_match, params)
    begin
      params[:url] = ApiAuth.client.get_song_url(song_match)
      params
    rescue
      sleep 4
      re_up_token
      get_and_add_url_param(song_match, params)
    end
  end
end
