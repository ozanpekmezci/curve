class AddHashToChats < ActiveRecord::Migration[5.0]
  def change
    add_column :chats, :hash, :string, null: false
  end
end
