class Room < ApplicationRecord
  belongs_to :User
  has_many :messages
end
