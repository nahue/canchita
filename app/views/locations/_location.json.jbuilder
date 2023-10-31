json.extract! location, :id, :name, :cover, :created_at, :updated_at
json.url location_url(location, format: :json)
json.cover url_for(location.cover)
