class SitesController < ApplicationController
  include SitesHelper

  before_filter :check_admin, only: [:player]

	# controls the music queues (listener and player)

	# home/index page GET, landing page
	def index
	end

	# GET display player page
	def player
	end

	# POSTs the results from adding a song to current user
  def add_song
    new_song = Song.create(title: params[:title], status: "added to My Q!")
    current_user.songs << new_song
    redirect_to root_url
  end

end

