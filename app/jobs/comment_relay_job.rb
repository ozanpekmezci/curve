class CommentRelayJob < ApplicationJob
  queue_as :default

  def perform(comment)
    ActionCable.server.broadcast "posts:#{comment.commentable_id}:comments", {user_id: "#{comment.user_id}"}
    #  comment: CommentsController.renderer.render(partial: 'comments/comment', locals: { comment: comment })
  end
end
