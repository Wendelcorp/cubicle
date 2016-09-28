class Space < ApplicationRecord
  belongs_to :user
  has_many :leases
  has_many :users, through: :leases
  has_many :images
  accepts_nested_attributes_for :images, :allow_destroy => true
end
