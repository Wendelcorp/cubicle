class CreateSpaces < ActiveRecord::Migration[5.0]
  def change
    create_table :spaces do |t|
      t.string :name
      t.integer :available_desks
      t.text :description
      t.decimal :price
      t.references :address, foreign_key: true

      t.timestamps
    end
  end
end
