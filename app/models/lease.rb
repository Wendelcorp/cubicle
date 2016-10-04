class Lease < ApplicationRecord
  belongs_to :space
  belongs_to :user
  belongs_to :status

  validates :desks, presence: true, numericality: {only_integer: true}
  validates :month, presence: true, numericality: {only_integer: true}
end
