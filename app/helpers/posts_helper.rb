module PostsHelper
  include ActsAsTaggableOn::TagsHelper

	##
	# sitepoint 2015 redis tutorial
  def get_posts_for_user
    @posts = policy_scope(Post)
  end

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
  def tag_links(tags)
    tags.map{|tag| link_to tag.strip, tag_path(tag.strip) }.join(", ")
  end
end
