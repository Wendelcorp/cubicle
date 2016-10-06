# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    return unless current_user
    current_user.is_online
    stream_from "appearance"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    return unless current_user
    current_user.is_offline
  end
end
