class Image < ApplicationRecord
  belongs_to :space, inverse_of: :images
  has_attached_file :location_picture,
                    :styles => {:medium => "600*600>", :thumb => "300*200>"},
                    :default_url => ActionController::Base.helpers.asset_path("default.jpg")

  validates_attachment_size :location_picture, less_than: 1.megabytes
  validates_attachment_content_type :location_picture, content_type: /\Aimage\/.*\z/

end
