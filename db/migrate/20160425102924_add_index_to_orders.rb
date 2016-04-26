class AddIndexToOrders < ActiveRecord::Migration[5.0]
  def change
   add_index :chats, :sender_id
   add_index :chats, :recipient_id
  end
end
