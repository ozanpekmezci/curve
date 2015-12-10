json.array!(@posts) do |post|
  json.extract! post, :id, :title, :description, :price, :lat, :lon, :likes, :picture_url
  json.url post_url(post, format: :json)
end
