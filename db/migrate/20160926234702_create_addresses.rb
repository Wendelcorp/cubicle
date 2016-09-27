class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :number
      t.string :street_name
      t.string :city
      t.string :province
      t.string :postal_code

      t.timestamps
    end
  end
end
