class AddSpaceIdToAddress < ActiveRecord::Migration[5.0]
  def change
    add_reference :addresses, :space, foreign_key: true
  end
end
