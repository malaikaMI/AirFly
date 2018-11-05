json.array!(@bookings) do |booking|
  json.extract! booking, :id, :flight_id, :passenger_id
  json.url booking_url(booking, format: :json)
end
