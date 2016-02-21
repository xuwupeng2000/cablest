# Be sure to restart your server when you modify this file. Action Cable runs in an EventMachine loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel

  def join(message)
    if find_room(message)
      stream_from "room_channel_#{@room_id}"
    end
  end

  def quit(room_id)
    if find_room(message)
      ActionCable.server.broadcast "room_channel_pub", {message: "#{current_user.name} have left room: #{@room.name}"}
    end
  end

  def speak(data)
    if find_room(data)
      ActionCable.server.broadcast "room_channel_#{@room.id}", {message: data[:message]}
    else
      ActionCable.server.broadcast "room_channel_pub", {message: data[:message]}
    end
  end

  private

  def find_room(data)
    @room ||= Room.find_by(id: data[:room_id])
    @room ? true : false
  end

end
