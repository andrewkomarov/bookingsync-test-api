json.extract! booking, :id, :rental_id, :email, :start_at, :end_at, :price, :created_at, :updated_at
json.url booking_url(booking, format: :json)
