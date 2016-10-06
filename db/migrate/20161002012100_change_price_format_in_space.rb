class ChangePriceFormatInSpace < ActiveRecord::Migration[5.0]
  def up
    change_column :spaces, :price, :decimal, precision: 30, scale: 2
  end

  def down
    change_column :spaces, :price, :decimal
  end
end
