class PostRelayJob < ApplicationJob
  queue_as :default

  def perform(post, current_user)
    ActionCable.server.broadcast "posts",
      post: PostsController.renderer.render(partial: 'posts/post', locals: { post: post, user: current_user })
  end

end
