class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.concat_address(address_id)
    address = self.find(address_id)
    return "#{address.number} #{address.street_name}, #{address.city}, #{address.province}, #{address.postal_code}"
  end


end



