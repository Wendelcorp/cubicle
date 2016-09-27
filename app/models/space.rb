class Space < ApplicationRecord
  belongs_to :address
  belongs_to :owner, class_name: 'User'
  has_many :leases
  has_many :users, through: :leases
end
