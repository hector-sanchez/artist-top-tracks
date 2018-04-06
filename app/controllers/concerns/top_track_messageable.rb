module TopTrackMessageable
  extend ActiveSupport::Concern

  included do
    after_action :sms_top_tracks
  end

  private

    def sms_top_tracks
      if @artist_top_track_request
        tracks = artist_top_tracks

        if tracks.empty?
          message = "There are no available tracks in the US region for #{@artist_top_track_request.artist_name}."
        else
          message = extract_sms_message_from_tracks(tracks)
        end

        SmsTool.send_sms(number: @artist_top_track_request.cell_phone_number, message: message)
      end
    end

    def extract_sms_message_from_tracks(tracks)
      tracks.map do |track|
        "** #{track.name}, popularity of #{track.popularity} from the #{track.album.name} album."
      end.join
    end

    def artist_top_tracks
      SpotifyTool.get_artist_tracks(artist_name: @artist_top_track_request.artist_name)
    end
end