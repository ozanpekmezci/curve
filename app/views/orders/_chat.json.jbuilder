json.(chat, :id)
json.fires(chat.fires) do |fire|
  json.extract! fire, :user_id, :id, :body :created_at
  json.user do
    json.extract! fire.user, :name, :id
  end
end
