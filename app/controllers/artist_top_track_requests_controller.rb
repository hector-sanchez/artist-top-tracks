class ArtistTopTrackRequestsController < ApplicationController
  include TopTrackMessageable

  def create
    @artist_top_track_request = ArtistTopTrackRequest.create!(
        artist_name: params["artist_name"],
        cell_phone_number: params["cell_phone_number"]
      )
    json_response @artist_top_track_request, :created
  end
end
