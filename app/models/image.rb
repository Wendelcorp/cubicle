class Image < ApplicationRecord
  belongs_to :space, inverse_of: :images
  has_attached_file :location_picture, :styles => {:medium => "600*600>", :thumb => "100*100>"}
  validates_attachment_content_type :location_picture, content_type: /\Aimage\/.*\z/
end
