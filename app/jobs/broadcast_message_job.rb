class BroadcastMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    #this is where we broadcast
    ActionCable.server.broadcast 'room_channel', render_message(message)
  end

  private
  def render_message(message)
    #new rails 5 feature :
    #purpose if for rails api
    ApplicationController.renderer.render(message)
    # uses all the cashing features of rails 
  end
end
