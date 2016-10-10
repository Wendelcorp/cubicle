class Image < ApplicationRecord
  belongs_to :space, inverse_of: :images
  has_attached_file :location_picture,
                    :styles => {:medium => "600*600>", :thumb => "300*200>"},
                    :default_url => 'https://s3-us-west-2.amazonaws.com/cubic-assets/default.jpg'

  validates_attachment_size :location_picture, less_than: 2.megabytes
  validates_attachment_content_type :location_picture, content_type: /\Aimage\/.*\z/

end
