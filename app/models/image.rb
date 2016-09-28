class Image < ApplicationRecord
  belongs_to :space
  has_attached_file :location_picture, :styles => {:medium => "600*600>", :thumb => "100*100>"}
end
