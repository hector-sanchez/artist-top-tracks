class CreateArtistTopTrackRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :artist_top_track_requests do |t|
      t.string :artist_name
      t.string :cell_phone_number

      t.timestamps
    end
  end
end
