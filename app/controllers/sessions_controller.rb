class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(email: user_params[:email])
    if @user && @user.authenticate(user_params[:password])
      open_session
      flash.notice = 'Logged in'
      redirect_to rooms_path
    else
      # TODO: build cable flash message
      flash.now.alert = 'Wrong password or email'
      render :new
    end
  end

  private

  def open_session
    Session.new.tap do |s|
      s.user = @user
      s.action = 'login'
    end.save

    session[:current_user] = @user
    cookies.signed[:user_id] = current_user.id
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
