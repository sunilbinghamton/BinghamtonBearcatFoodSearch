json.array!(@reviews_and_ratings) do |reviews_and_rating|
  json.extract! reviews_and_rating, :id
  json.url reviews_and_rating_url(reviews_and_rating, format: :json)
end
