class AppearanceBroadcastJob < ApplicationJob
  queue_as :default

  def perform(user)
    # Do something later
    ActionCable.server.broadcast "appearance", render_json({id:user.id,online:user.online})
  end

  private

  def render_json(userdata)
    ApplicationController.renderer.render(json:userdata)
  end

end
