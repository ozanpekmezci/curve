class FireRelayJob < ApplicationJob
  queue_as :default

  def perform(fire)
    ActionCable.server.broadcast "chats:#{fire.chat.id.to_i}",
      fire: OrdersController.renderer.render(partial: 'orders/chat', locals: {chat: chat})
      #'fires/fire', locals: { fire: fire }
  end
end
