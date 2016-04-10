class PostRelayJob < ApplicationJob
  queue_as :default

  def perform(post)

    @following_users = []
    # @following_tags = []

    User.find_by(id: post.user_id).followers.each do |u|
        @following_users.push(u)
    end

    User.all.each do |u|
      if (u.follow_tags & post.all_labels_list).any?
        @following_users.push(u)
      end
    end

    @following_users.uniq!

    @following_users.each do |u|
      ActionCable.server.broadcast "posts_#{u.id}", {title: "new post"}

      #post: PostsController.renderer.render(partial: 'posts/post', locals: { post: post, user: u})
    end
  end
end
