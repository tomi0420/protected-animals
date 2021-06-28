class RoomsController < ApplicationController

  def index
    @user = User.find(params[:id])
    @rooms = @user.rooms
  end

  def create
    @room = Room.where(user_id: params[:room][:user_id], conservation_group_id: params[:room][:conservation_group_id], animal_id: params[:room][:animal_id]).first_or_initialize(room_params)
    @room.save
    @chat = Chat.new
  end

  def show
    @room = Room.find(params[:id])
    @user = @room.user
    @rooms = @user.rooms
    @chat = Chat.new
  end

  private

  def room_params
    params.require(:room).permit(:name, :user_id, :conservation_group_id, :animal_id)
  end

end
