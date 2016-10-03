class RemoveOwnerFromChatRooms < ActiveRecord::Migration[5.0]
  def change
    drop_table :chat_rooms
    remove_column :rooms, :owner
  end
end
