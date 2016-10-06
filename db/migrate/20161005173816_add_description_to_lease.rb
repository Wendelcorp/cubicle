class AddDescriptionToLease < ActiveRecord::Migration[5.0]
  def change
    add_column :leases, :description, :text
  end
end
