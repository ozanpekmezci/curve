class Post < ActiveRecord::Base
  #one to many relationship with posts and users
  belongs_to :user
  # sitepont 2015 redis tuto to clear cache after each creation of different posts
  # after_save :clear_cache

  # posts can be tagged
  acts_as_taggable_on :labels
  # posts have comments (one to many relationship)
  acts_as_commentable
#  after_create_commit { PostRelayJob.perform_later self }
  mount_uploaders :pictures, PostImageUploader
  searchkick autocomplete: ['title'],word_start: [:title]
  #post.users falan yapabilmek icin (notification amacli)
  has_many :users, through: :comments
  has_many :likes


  ##
  # to clear cache after each creation of different posts
  def clear_cache
    $redis.del "posts"
  end
end
