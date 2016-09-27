class Lease < ApplicationRecord
  belongs_to :space
  belongs_to :user
  belongs_to :status
  
end
