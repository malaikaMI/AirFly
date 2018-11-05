json.array!(@flights) do |flight|
  json.extract! flight, :id, :from, :to, :departure, :arrival, :plane_id
  json.url flight_url(flight, format: :json)
end
