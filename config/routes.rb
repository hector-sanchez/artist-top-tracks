Rails.application.routes.draw do
  resources :artist_top_track_requests, only: :create
end
