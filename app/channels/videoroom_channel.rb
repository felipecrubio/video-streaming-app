class VideoroomChannel < ApplicationCable::Channel
  def subscribed
    videoroom = Videoroom.find_by(id: params[:id])
    stream_for videoroom
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
