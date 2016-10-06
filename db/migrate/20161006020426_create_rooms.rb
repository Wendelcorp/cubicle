class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.references :user1
      t.references :user2
      t.timestamps
    end
  end
end
