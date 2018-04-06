class ArtistTopTrackRequestsController < ApplicationController
  include TopTrackMessageable

  def create
    @artist_top_track_request = ArtistTopTrackRequest.create!(artist_top_track_request_params)
    json_response @artist_top_track_request, :created
  end

  private

    def artist_top_track_request_params
      params.permit(:artist_name, :cell_phone_number)
    end
end
