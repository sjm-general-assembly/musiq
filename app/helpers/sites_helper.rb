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

	def search_for_songs(search_title, search_result_list)

	  # if no string has been entered, do nothing / stay on same page
	  unless search_title.empty?
		  # search string, must (or should per examples) contain '+' between words, instead of spaces
		  search_title.gsub!(' ','+')

		  # GET request for Google Youtube API, search for video titles
		  response = Typhoeus.get("https://www.googleapis.com/youtube/v3/search",
		    :params =>  {
		                  :part => 'snippet',
		                  :maxResults => '50',
		                  :q => search_title,
		                  :type => 'video',
		                  :videoEmbeddable => 'true',
		                  :key => ENV['YT_API_KEY']
		                })

		  # store result in a hash, for better parsing
		  result_hash = JSON.parse(response.body)

puts(' ')
puts('  #################################### ')
puts('  sesssion marker: ' + ENV['YT_API_KEY'])
puts('  search string: ' + search_title)
puts('  response code: ' + response.options[:response_code].to_s)
puts('  #################################### ')
puts(' ')

		  if response.options[:response_code] == 200 && !result_hash.empty?
		    result_hash["items"].each do |v| 
		    	search_result_list << {:title => v["snippet"]["title"], :video_id => v["id"]["videoId"]} 
		    end
		  end
		end
	end

end
