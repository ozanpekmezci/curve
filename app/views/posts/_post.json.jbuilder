json.(post, :id)
json.comments(post.comments) do |comment|
  json.extract! comment, :user_id, :id,:comment ,:price, :created_at
end
