class ApplicationController < ActionController::Base
  helper_method :current_user
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  def current_user
    return nil unless session[:current_user]

    if session[:current_user].is_a?(User)
      user = session[:current_user]
    else
      u = Hashie::Mash.new session[:current_user]
      user = User.find(u.id)
    end
    user
  end
  alias logged_in? current_user

  def redirect_to_rooms
    if logged_in?
      flash.notice = 'Find the best room and enjoy yourself'
      redirect_to rooms_path
    end
  end
end
