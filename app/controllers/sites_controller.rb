class SitesController < ApplicationController
  include SitesHelper

  before_filter :check_admin, only: [:player, :play_next]

	# controls the music queues (listener and player)

	# home/index page GET, landing page
	def index
	end

	# GET display player page
	def player
		# locate now-playing track
		now_playing_track = Track.find_by(status: 'now playing')
		now_playing_track.nil? ? @current_track = "" : @current_track = now_playing_track.title

		#show remaining tracks to play
		@tracks = Track.where(status: 'waiting')
	end

	# POST this method sets now playing track, to next track in the q, and removes from q
	def play_next
		# locate now-playing and next-playing tracks
		now_playing_track = Track.find_by(status: 'now playing')
		next_track = Track.find_by(status: 'waiting')

		# remove now-playing track
		unless now_playing_track.nil?
			now_playing_track.destroy  # TODO, (tbd) may want to archive this, move to a play history
		end

		# check to make sure there is at least one song in q to play
		unless next_track.nil?
			# set now-playing track to next track in q
			next_track.update(status: 'now playing')
			@current_track = next_track.title
    else
      flash[:error] = 'No music to play! Go gets some requests!'

			# set now playing track to empty (this essentially ends the previously playing song)
			@current_track = ""
		end

		#show remaining tracks to play
		@tracks = Track.where(status: 'waiting')
  
  	# redisplay player page
    redirect_to '/player'
	end

	# POSTs the results from adding a song to current user
  def add_song
  	# add this song to the users personal list (history)
    new_song = Song.create(title: params[:title], status: "added to MusiQ!")
    current_user.songs << new_song

    # add this song to the player queue (tracks)
    Track.create(title: params[:title], user_id: current_user.id, status: 'waiting')
    redirect_to root_url
  end

end

