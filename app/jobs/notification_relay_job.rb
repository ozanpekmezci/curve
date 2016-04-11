class NotificationRelayJob < ApplicationJob
  queue_as :default

  def perform(notification)


      ActionCable.server.broadcast "notifications_#{notification.recipient.id}", {title: "new notification"}

      #post: PostsController.renderer.render(partial: 'posts/post', locals: { post: post, user: u})
    end
  end
end
