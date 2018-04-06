module FakeSpotify
  Track = Struct.new(:name, :popularity, :album)
  Album = Struct.new(:name)

  @tracks = []

  def self.get_artist_tracks(artist_name:)
    unless artist_name == 'invalid artist'
      3.times do |index|
        @tracks << Track.new("track #{index + 1}", (index + 1) + rand(100), Album.new("Album #{index + 1} from #{artist_name}"))
      end
    end
    @tracks
  end

  def self.tracks
    @tracks
  end
end