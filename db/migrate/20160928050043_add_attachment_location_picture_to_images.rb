class AddAttachmentLocationPictureToImages < ActiveRecord::Migration
  def self.up
    change_table :images do |t|
      t.attachment :location_picture
    end
  end

  def self.down
    remove_attachment :images, :location_picture
  end
end
