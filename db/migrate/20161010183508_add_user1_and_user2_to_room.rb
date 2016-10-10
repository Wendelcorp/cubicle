class AddUser1AndUser2ToRoom < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :user1_id, :integer
    add_column :rooms, :user2_id, :integer
  end
end
