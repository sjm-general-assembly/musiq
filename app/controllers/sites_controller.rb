class SitesController < ApplicationController
  include SitesHelper

  before_filter :check_admin, only: [:player, :play_next]

	# controls the music queues (listener and player)

	# home/index page GET, landing page
	def index
	end

	# GET display player page
	def player
		@current_track = Track.first
		@tracks = Track.all
	end

	# 

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

