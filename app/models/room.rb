class Room < ApplicationRecord
  belongs_to :user1, :class_name => 'User'
  belongs_to :user2, :class_name => 'User'
  has_many :messages


  def update_timestamp_user1
    self.update_attributes(user1_visited_timestamp: Time.now)
  end

  def update_timestamp_user2
    self.update_attributes(user2_visited_timestamp: Time.now)
  end

end
