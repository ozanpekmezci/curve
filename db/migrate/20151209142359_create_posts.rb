class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.float :lat
      t.float :lon
      t.integer :likes
      t.string :picture_url
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    #index for post attributes for performance
    add_index :posts, :title
    add_index :posts, :description
    add_index :posts, :price
    add_index :posts, :lat
    add_index :posts, :lon
    add_index :posts, :picture_url
  end
end
