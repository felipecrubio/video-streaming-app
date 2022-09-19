class MessagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %w[create]

  def create
    @videoroom = Videoroom.find_by(id: params[:videoroom_id])
    @message = Message.new(message_params)
    @message.videoroom = @videoroom
    @message.user = current_user
    if @message.save
      VideoroomChannel.broadcast_to(
        @videoroom,
        render_to_string(partial: "message", locals: { message: @message })
      )
      head :ok
    elsif current_user.nil?
      redirect_to new_user_registration_path
    else
      render "videorooms/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
