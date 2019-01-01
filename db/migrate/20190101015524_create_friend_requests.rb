class CreateFriendRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :friend_requests do |t|
      t.references :user, foreign_key: true
      t.bigint :friend_id, null: false

      t.timestamps
    end
    add_foreign_key :friend_requests, :users, column: :friend_id
    add_index :friend_requests, :friend_id
  end
end
