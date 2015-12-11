class Post < ActiveRecord::Base
  # sitepont 2015 redis tuto to clear cache after each creation of different posts
  after_save :clear_cache
  ##
  # to clear cache after each creation of different posts
  def clear_cache
    $redis.del "posts"
  end
end
