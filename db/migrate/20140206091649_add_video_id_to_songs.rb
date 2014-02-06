class AddVideoIdToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :video_id, :string
  end
end
