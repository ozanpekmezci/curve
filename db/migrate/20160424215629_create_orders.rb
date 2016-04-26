class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string, :order_status
      t.integer, :buyer_id
      t.integer, :seller_id
      t.datetime, :sold_at
      t.datetime, :shipped_at
      t.string, :shipping_name
      t.string, :shipping_address
      t.string, :shipping_address_2
      t.string, :shipping_city
      t.string, :shipping_state
      t.string, :shipping_zip
      t.string, :shipping_country
      t.string, :shipping_phone
      t.string, :billing_name
      t.string, :billing_address
      t.string, :billing_address_2
      t.string, :billing_city
      t.string, :billing_state
      t.string, :billing_zip
      t.string, :billing_country
      t.string, :billing_phone
      t.integer :tax_price
      t.integer :shipping_price
      t.integer :total_price
      t.references :comment, foreign_key: true
      t.integer :unit_price
      t.integer :quantity
      t.string :guid
      t.string :orderhash

      t.timestamps
    end
  end
end
