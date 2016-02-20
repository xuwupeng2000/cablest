class RoomsController < ApplicationController
  before_action :logged_in?

  def new
    @room = Room.new(name: Faker::Company.name)
  end

  def create
    @room = Room.new(room_params).tap do |e|
      e.user = current_user
    end
    @room.save!

    redirect_to rooms_path
  end

  def index
    @rooms = Room.all
  end

  private

  def logged_in?
    redirect_to root_path, alert: 'Login is required' unless current_user
  end

  def room_params
    params.require(:room).permit(:name)
  end

end
