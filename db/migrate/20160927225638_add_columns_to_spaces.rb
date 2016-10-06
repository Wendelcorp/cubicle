class AddColumnsToSpaces < ActiveRecord::Migration[5.0]
  def change
    add_column :spaces, :number, :integer
    add_column :spaces, :street_name, :string
    add_column :spaces, :city, :string
    add_column :spaces, :province, :string
    add_column :spaces, :postal_code, :string
  end
end
