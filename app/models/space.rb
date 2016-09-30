class Space < ApplicationRecord
  belongs_to :user
  has_many :leases
  has_many :users, through: :leases
  has_many :images, inverse_of: :space, dependent: :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true

  geocoded_by :postal_code
  after_validation :geocode
end
