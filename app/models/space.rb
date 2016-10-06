class Space < ApplicationRecord
  belongs_to :user
  has_many :leases
  has_many :users, through: :leases
  has_many :images, inverse_of: :space, dependent: :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true
  geocoded_by :postal_code
  after_validation :geocode

  validates :name, presence: true
  validates :available_desks, presence: true, numericality: {only_integer: true}
  validates :description, presence: true
  validates :number, presence: true, numericality: true
  validates :street_name, presence: true
  validates :city, presence: true
  validates :province, presence: true
  #validates canadian postal code
  #canadian_postal_code = /\A[ABCEGHJKLMNPRSTVXY]{1}\\d{1}[A-Z]{1}[ -]?\\d{1}[A-Z]{1}\\d{1}\z/
  #validates :postal_code, presence: true, format: { with: canadian_postal_code }
  validates :postal_code, presence: true





#finds all leases where lease status is 2(confirmed)
  def self.available_leases(space)
    leases = Lease.where(space_id: space.id)
    array = []
    leases.each do |lease|
      if lease.status_id == 2
        array << lease
      end
    end
    return array
  end

#takes collection of confirm leases and returns count of desks
  def self.taken_desks(array)
    count = 0
    array.each do |lease|
      count += lease.desks
    end
    return count
  end

end
