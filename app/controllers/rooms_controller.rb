class RoomsController < ApplicationController

  def create
    @room = Room.new(room_params)
    if @room.save
       redirect_to room_chats_path(@room)         # 重複しても保存される（あとで直す）
    end
  end

  private

  def room_params
    params.require(:room).permit( :name, :user_id, :conservation_group_id )
  end

end
