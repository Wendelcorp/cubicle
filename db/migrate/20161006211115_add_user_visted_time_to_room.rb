class AddUserVistedTimeToRoom < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :user1_visited_timestamp, :timestamp, default: Time.now
    add_column :rooms, :user2_visited_timestamp, :timestamp, default: Time.now
  end
end
