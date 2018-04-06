FactoryBot.define do
  factory :artist_top_track_request do
    artist_name { Faker::StarWars.character }
    cell_phone_number '2122312143'
  end
end