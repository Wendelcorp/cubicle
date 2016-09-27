class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :spaces
  has_many :leases
  has_many :owned_spaces, class_name: "Space"
  has_many :spaces, through: :leases

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
