class AddDefaultToStatusInLeases < ActiveRecord::Migration[5.0]
  def change
    change_column :leases, :status_id, :integer, :default => 0
  end
end
