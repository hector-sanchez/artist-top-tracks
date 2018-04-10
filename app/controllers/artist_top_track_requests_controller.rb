class ArtistTopTrackRequestsController < ApplicationController
  before_action :build_artist_top_track_request

  include TopTrackMessageable

  def create
    @sms = sms_top_tracks
    @artist_top_track_request.sms_status = @sms.status === "queued" ? 1 : 0
    @artist_top_track_request.save!
    json_response @artist_top_track_request, :created
  end

  private

    def build_artist_top_track_request
      @artist_top_track_request = ArtistTopTrackRequest.new(
        artist_name: params["artist_name"],
        cell_phone_number: params["cell_phone_number"]
      )
    end
end
