class RoomsController < ApplicationController

  def create
    @room = Room.new(room_params)
    binding.pry
    if @room.save 
      redirect_to root_path
    end
  end


  private

  def room_params
    params.require(:room).permit( :name, :user_id, :conservation_group_id )
  end

end
