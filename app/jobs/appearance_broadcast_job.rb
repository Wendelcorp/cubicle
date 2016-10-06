class AppearanceBroadcastJob < ApplicationJob
  queue_as :default

  def perform(user)
    # Do something later
    ActionCable.server.broadcast "appearance", render_json(user)
  end

  private

  def render_json(user)
    ApplicationController.renderer.render(json:user)
  end

end
