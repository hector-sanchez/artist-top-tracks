require 'rspotify'

module SpotifyTool
  account_sid = ENV['SPOTIFY_ACCOUNT_SID']
  auth_token = ENV['SPOTIFY_AUTH_TOKEN']

  RSpotify.authenticate(
    ENV['SPOTIFY_ACCOUNT_SID'],
    ENV['SPOTIFY_AUTH_TOKEN'])

  def self.get_artist_tracks(artist_name:)
    artist = RSpotify::Artist.search("#{artist_name}").first
    artist.nil? ? [] : artist.top_tracks(:US).first(3)
  end
end