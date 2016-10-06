module ApplicationHelper

  def active_or_inactive
    Room.find_each do |rom|
      return 'active' if check_room(rom)
    end
    'inactive'
   end

   def check_room(rom)
     if rom.user1 == current_user
        return true if check_messages(rom, rom.user1_visited_timestamp)
     elsif rom.user2 == current_user
        return true if check_messages(rom, rom.user2_visited_timestamp)
     end
   end

   def check_messages(rom, user_visited_timestamp)
     rom.messages.each do |message|
       return true if message.updated_at > user_visited_timestamp
     end
     false
   end

end
