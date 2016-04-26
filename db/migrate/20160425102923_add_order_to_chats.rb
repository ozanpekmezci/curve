class AddOrderToChats < ActiveRecord::Migration[5.0]
  def change
   add_reference(:chats, :chatable, polymorphic: true, index: true)

  end
end
