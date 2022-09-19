class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @videorooms = Videoroom.all
    @message = Message.new
  end
end
