class RoomsController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @rooms = @user.rooms
    render 'users/show'
  end

  def create
    @room = Room.where(user_id: params[:room][:user_id], conservation_group_id: params[:room][:conservation_group_id], animal_id: params[:room][:animal_id]).first_or_initialize
    @room.save
    redirect_to room_chats_path(@room)
  end

end
