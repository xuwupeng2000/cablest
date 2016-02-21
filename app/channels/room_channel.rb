# Be sure to restart your server when you modify this file. Action Cable runs in an EventMachine loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel

  def join(data)
    data.symbolize_keys!
    # TODO: send messate to specific room
    stream_from "room_channel"
  end

  def quit()

  end

  def speak(data)
    data.symbolize_keys!
    # TODO: send messate to specific room
    ActionCable.server.broadcast "room_channel", {message: data[:message]}
  end

  private

  def find_room(data)
    @room = Room.find_by(id: data[:roomId])
    @room ? true : false
  end

end
