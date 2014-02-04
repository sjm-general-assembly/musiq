class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
