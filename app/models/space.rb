class Space < ApplicationRecord
  belongs_to :user
  has_many :leases
  has_many :users, through: :leases
  accepts_nested_attributes_for :address, reject_if: :all_blank, allow_destroy: true
end
