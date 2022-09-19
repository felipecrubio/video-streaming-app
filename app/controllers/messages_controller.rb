class MessagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %w[create]

  def create
    @videoroom = Videoroom.find_by(id: params[:videoroom_id])
    @message = Message.new(message_params)
    @message.videoroom = @videoroom
    @message.user = current_user
    if @message.save
      redirect_to videoroom_path(@videoroom)
    else
      render "videorooms/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
