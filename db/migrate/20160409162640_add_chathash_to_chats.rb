class AddChathashToChats < ActiveRecord::Migration[5.0]
  def change
    remove_column :chats, :hash
    add_column :chats, :chathash, :string, null: false

  end
end
