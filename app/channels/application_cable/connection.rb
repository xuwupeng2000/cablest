# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      current_user = find_current_user
      if current_user
        self.current_user = current_user
      else
        redirect_to_pub
      end
      logger.add_tags 'ActionCable', current_user.name
    end

    private

    def find_current_user
      current_user = User.find_by(id: cookies.signed[:user_id])

      reject_unauthorized_connection unless current_user
    end

    def redirect_to_pub
      # Unsigned user go to the pub
      steam_from 'the_pub'
    end

  end
end
