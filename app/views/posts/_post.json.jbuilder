json.(post, :id)
json.comments(post.comments) do |comment|
  json.extract! comment, :user_id, :id, :title,:comment ,:price, :created_at
  json.user do
    json.extract! comment.user, :name, :id
  end
end
