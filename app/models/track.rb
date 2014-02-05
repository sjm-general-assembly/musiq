# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  status     :string(255)
#

class Track < ActiveRecord::Base
  belongs_to :user
end
