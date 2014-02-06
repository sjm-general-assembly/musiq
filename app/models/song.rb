# == Schema Information
#
# Table name: songs
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#  status     :string(255)
#  video_id   :string(255)
#

class Song < ActiveRecord::Base
	belongs_to :user
end
