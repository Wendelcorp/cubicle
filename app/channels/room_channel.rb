# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    room = Room.find(params[:room])
    return unless current_user.id = room.user1_id || current_user.id = room.user2_id
    stream_from "room_#{params[:room]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
