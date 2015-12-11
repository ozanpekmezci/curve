module PostsHelper
	##
	# sitepoint 2015 redis tutorial
	def fetch_posts
    posts =  $redis.get("posts")
    if posts.nil?
      posts = Post.all.to_json
      $redis.set("posts", posts)
       # Expire the cache, every 3 hours
      $redis.expire("posts",3.hour.to_i)
    end
    @posts= JSON.load posts
  end
end
