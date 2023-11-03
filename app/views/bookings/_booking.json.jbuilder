json.extract! booking, :id, :start_at, :end_at, :created_at, :updated_at
json.url booking_url(booking, format: :json)
