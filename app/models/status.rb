class Status < ApplicationRecord
  has_many :leases

  validates :name, presence: true
end
