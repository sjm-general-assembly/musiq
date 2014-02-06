module SitesHelper

	# a user must be signed in, and be an administrator to view the player.
	def check_admin
   	if !signed_in?
   		flash[:error] = "Must be signed in as an admin to view player."
			redirect_to root_url
		elsif current_user.role != 'admin'
   		flash[:error] = "Must be signed in as an admin to view player."
			redirect_to root_url
		end
	end

	def search_youtube_videos
	end

end
