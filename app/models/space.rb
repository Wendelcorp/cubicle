class Space < ApplicationRecord
  belongs_to :address
  belongs_to :user
  has_many :leases
  has_many :users, through: :leases
end
