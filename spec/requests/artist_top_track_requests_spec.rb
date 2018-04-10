require 'rails_helper'

RSpec.describe 'Artist Top Tracks Request', type: :request do
  let!(:artist_top_track_requests) { create_list(:artist_top_track_request, 10) }

  describe 'POST / artist top tracks' do
    let(:valid_attributes) { { artist_name: 'Justin Bieber', cell_phone_number: '(212) 212-3900' } }

    context 'when the request is valid but the artist name is not' do
      before do
        post  '/artist_top_track_requests', params: { artist_name: 'invalid artist', cell_phone_number: '(718) 310-9090' }
      end

      it 'returns status code 201' do
        expect(response).to have_http_status 201
      end

      it 'sends sms message with artist not found message' do
        expect(SmsTool.message.message).to match(/There are no available tracks in the US region for invalid artist./)
      end
    end

    context 'when the request is valid' do
      before do
        post '/artist_top_track_requests', params: valid_attributes
      end

      it 'creates an artist top tracks request' do
        expect(json['artist_name']).to eq 'Justin Bieber'
      end

      it 'returns status code 201' do
        expect(response).to have_http_status 201
      end

      it 'sends sms message' do
        expect(SmsTool.message).to_not be_nil
      end
    end

    context 'when the request is invalid' do
      before do
        post  '/artist_top_track_requests', params: { cell_phone_number: '(718)310-9090' }
      end

      it 'returns status code 422' do
        expect(response).to have_http_status 422
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Artist name can't be blank/)
      end
    end
  end
end