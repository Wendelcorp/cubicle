class Address < ApplicationRecord
  belongs_to :space, :inverse_of => :address
end
