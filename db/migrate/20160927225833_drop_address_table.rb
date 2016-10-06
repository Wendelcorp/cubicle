class DropAddressTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :spaces, :address_id
    drop_table :addresses
  end
end
