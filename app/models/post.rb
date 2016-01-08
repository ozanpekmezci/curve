class Post < ActiveRecord::Base
  #one to many relationship with posts and users
  belongs_to :user
  # sitepont 2015 redis tuto to clear cache after each creation of different posts
  # after_save :clear_cache

  acts_as_commentable
  ##
  # to clear cache after each creation of different posts
  def clear_cache
    $redis.del "posts"
  end
end
