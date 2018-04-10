class AddSmsStatusToArtistTopTrackRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :artist_top_track_requests, :sms_status, :integer
  end
end
