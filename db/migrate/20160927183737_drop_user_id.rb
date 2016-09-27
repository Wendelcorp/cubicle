class DropUserId < ActiveRecord::Migration[5.0]
  def change
    remove_column :spaces, :user_id
  end
end
