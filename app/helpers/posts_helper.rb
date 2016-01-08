module PostsHelper
	##
	# sitepoint 2015 redis tutorial
	def fetch_posts
    pre_posts = $redis.get("posts")
    unless pre_posts.nil?
      posts =  Marshal.load(pre_posts)
    else 
      
      posts = Post.all
      $redis.set("posts", Marshal.dump(posts))
      # posts =  Marshal.load($redis.get("posts"))


      # Expire the cache, every 3 hours
      $redis.expire("posts",3.hour.to_i)
     end
    @posts = posts
  end
  #$redis.set("itens", Marshal.dump(Item.all))
  #Marshal.load($redis.get("itens"))
end
