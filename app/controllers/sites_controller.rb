class SitesController < ApplicationController
  include SitesHelper

  before_filter :check_admin, only: [:player, :play_next]

	# controls the music queues (listener and player)

	# home/index page GET, landing page
	def index
	end

	# GET display player page
	def player
		@current_track = session[:current_track]
		@tracks = Track.all
	end

	# POST this method sets now playing track, to next track in the q, and removes from q
	def play_next

		# check to make sure there is at least one song in q to play
		if Track.count >= 1
			# set now playing track to next track in q
			current_track = Track.first
			session[:current_track], @current_track = current_track.title

			# remove now playing track from q
			current_track.destroy				# LATER, may want to archive this, move to a play history
    else
      flash[:error] = 'No music to play! Go gets some requests!'

			# set now playing track to empty (this essentially ends the previously playing song)
			session[:current_track], @current_track = ""
		end

		#show remaining tracks to play
		@tracks = Track.all
  
  	# redisplay player page
    redirect_to '/player'
	end

	# POSTs the results from adding a song to current user
  def add_song
  	# add this song to the users personal list (history)
    new_song = Song.create(title: params[:title], status: "added to My Q!")
    current_user.songs << new_song

    # add this song to the player queue (tracks)
    Track.create(title: params[:title], user_id: current_user.id)
    redirect_to root_url
  end

end

