json.array!(@food_courts) do |food_court|
  json.extract! food_court, :id
  json.url food_court_url(food_court, format: :json)
end
