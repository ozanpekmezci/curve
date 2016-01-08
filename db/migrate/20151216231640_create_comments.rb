class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :title, :limit => 50, :default => "" 
      t.text :comment
      t.references :commentable, :polymorphic => true
      t.references :user
      t.string :role, :default => "comments"
      t.timestamps
      t.integer :price
      t.float :lat
      t.float :lon
      t.integer :likes
      t.string :picture_url
    end

    add_index :comments, :commentable_type
    add_index :comments, :commentable_id
    add_index :comments, :user_id
    #index for post attributes for performance
    add_index :comments, :title
    add_index :comments, :comment
    add_index :comments, :price
    add_index :comments, :lat
    add_index :comments, :lon
    add_index :comments, :picture_url
  end

  def self.down
    drop_table :comments
  end
end
