module PostsHelper
	##
	# sitepoint 2015 redis tutorial
	def fetch_posts
    # posts = $redis.get("posts")
    # if posts.nil?
      # posts = Post.all.to_json
      $redis.set("posts", Marshal.dump(Post.all))
      posts =  Marshal.load($redis.get("posts"))


      # Expire the cache, every 3 hours
      $redis.expire("posts",3.hour.to_i)
    # end
    @posts = posts
  end
  #$redis.set("itens", Marshal.dump(Item.all))
  #Marshal.load($redis.get("itens"))
end
