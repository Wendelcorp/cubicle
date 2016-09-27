class CreateLeases < ActiveRecord::Migration[5.0]
  def change
    create_table :leases do |t|
      t.integer :desks
      t.integer :month
      t.references :user, foreign_key: true
      t.references :status, foreign_key: true
      t.references :space, foreign_key: true

      t.timestamps
    end
  end
end
