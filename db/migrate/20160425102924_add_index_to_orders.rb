class AddIndexToOrders < ActiveRecord::Migration[5.0]
  def change
   add_index :orders, :buyer_id
   add_index :orders, :seller_id
  end
end
