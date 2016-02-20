class MessagesController < ApplicationController

  def create
    @room = Room.find(params[:room_id])
    @message = Message.new(message_params).tap do |m|
      m.room = @room
      m.user = current_user
    end
    if @message.save
      flash.notice = 'Message is created'
      redirect_to room_path(@room)
    else
      flash.alert = "Message can not be created due to #{@message.errors.full_messages.join(',')}"
      redirect_to room_path(@room)
    end
  end

  def update
  end

  private

  def message_params
    params.require(:message).permit(:title, :content)
  end

end
