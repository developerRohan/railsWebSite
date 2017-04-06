class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :add_friend_id, index: true, foreign_key: { to_table: :users }
      t.integer :friend_id, index: true, foreign_key: { to_table: :users }
      t.timestamps null: false
    end
  end
end
