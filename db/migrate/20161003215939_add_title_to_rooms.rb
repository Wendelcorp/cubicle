class AddTitleToRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :title, :string
  end
end
