json.array!(@food_outlets) do |food_outlet|
  json.extract! food_outlet, :id
  json.url food_outlet_url(food_outlet, format: :json)
end
