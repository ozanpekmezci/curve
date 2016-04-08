class CreateFires < ActiveRecord::Migration[5.0]
  def change
    create_table :fires do |t|
      t.text :body
      t.references :chat, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
