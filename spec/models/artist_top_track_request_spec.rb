require 'rails_helper'

RSpec.describe ArtistTopTrackRequest, type: :model do
  it { should validate_presence_of :artist_name }
  it { should validate_presence_of :cell_phone_number }
  it { should allow_value('2125555555').for(:cell_phone_number) }
  it { should allow_value('(212) 555-5555').for(:cell_phone_number) }
  it { should allow_value('(212)555-5555').for(:cell_phone_number) }
  it { should allow_value('212-555-5555').for(:cell_phone_number) }
  it { should_not allow_value('').for(:cell_phone_number) }
  it { should_not allow_value('1'*9).for(:cell_phone_number) }
  it { should_not allow_value('1'*11).for(:cell_phone_number) }
  it { should_not allow_value('abcdefghij').for(:cell_phone_number) }
end
