class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment

  belongs_to :commentable, :polymorphic => true
  has_many :orders
  validates_numericality_of :price,
		greather_then: 49, message: "Must be at least 50 cents"

  default_scope -> { order('created_at ASC') }

  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_voteable

  # NOTE: Comments belong to a user
  belongs_to :user

  after_create_commit { CommentRelayJob.perform_later self }
end
