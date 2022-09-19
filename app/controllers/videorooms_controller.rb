class VideoroomsController < ApplicationController
  skip_before_action :authenticate_user!, only: %w[show new create]

  def show
    @videoroom = Videoroom.find_by(id: params[:id])
    @message = Message.new
  end

  def new
    @videoroom = Videoroom.new
  end

  def create
    @videoroom = Videoroom.new(videoroom_params)

    if @videoroom.save
      redirect_to @videoroom, notice: "Sala criada com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def videoroom_params
    params.require(:videoroom).permit(:name)
  end
end
