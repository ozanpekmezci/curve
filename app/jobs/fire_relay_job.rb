class FireRelayJob < ApplicationJob
  queue_as :default

  def perform(fire)
    ActionCable.server.broadcast "chats:#{fire.chat.id.to_i}",
      fire: FiresController.renderer.render(partial: 'fires/fire', locals: { fire: fire })
  end
end
