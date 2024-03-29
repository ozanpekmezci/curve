class CommentRelayJob < ApplicationJob
  queue_as :default

  def perform(comment)
    logger.debug "#{comment.id} #{comment.comment}"
    ActionCable.server.broadcast "posts:#{comment.commentable_id}:comments", {user_id: "#{comment.user_id}",
      comment: PostsController.renderer.render(partial: 'posts/post.json', locals: {post: comment.commentable})}
    #  comment: CommentsController.renderer.render(partial: 'comments/comment', locals: { comment: comment })
  end
end
