# Be sure to restart your server when you modify this file. Action Cable runs in an EventMachine loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel
  def join(room_id)
    validate_room

    stream_from "room_channel_#{@room_id}"
  end

  def quit(room_id)
    validate_room

    ActionCable.server.broadcast "room_channel_#{@room.id}", {message: "You have left room #{@room.name}"}
  end

  def speak(message)
    validate_room

    ActionCable.server.broadcast "room_channel_#{@room.id}", {message: message}
  end

  def host(name)
    new_room = Room.new.tap do |r|
      r.user = current_user
      r.name = name
    end
    new_room.save!
  end

  private

  def validate_room
    @room ||= Room.find(room_id)
    reject_unauthorized_connection unless @room
  end

end
