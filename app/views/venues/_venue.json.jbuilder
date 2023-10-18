json.extract! venue, :id, :name, :cover, :created_at, :updated_at
json.url venue_url(venue, format: :json)
json.cover url_for(venue.cover)
