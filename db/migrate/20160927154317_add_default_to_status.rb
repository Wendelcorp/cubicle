class AddDefaultToStatus < ActiveRecord::Migration[5.0]
  def change
    change_column_default :leases, :status_id, 0
  end
end
