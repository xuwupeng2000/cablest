class ApplicationController < ActionController::Base
  helper_method :current_user
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  def current_user
    return nil unless session[:current_user]

    user = session[:current_user]
    user
  end
  alias logged_in? current_user
end
