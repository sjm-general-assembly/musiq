class SitesController < ApplicationController

	# home/index page GET, landing page
	def index
	end

	# POSTs the results from adding a song to current user
  def add_song
    new_song = Song.create(title: params[:title], status: "added to My Q!")
    current_user.songs << new_song
    redirect_to root_url
  end

end

