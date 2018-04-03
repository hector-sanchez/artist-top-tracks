class ArtistTopTrackRequest < ApplicationRecord
  validates :cell_phone_number,
            presence: true,
            format: /\A\(?([2-9]\d{2})\)? ?-?(\d{3})-?(\d{4})\z/,
            length: {in: 1..15}
  validates_presence_of :artist_name
end
