class ChatsController < ApplicationController

  def index
    @chat = Chat.new
    @room = Room.find(params[:room_id])
    @chats = @room.chats.includes(:user, :conservation_group)
  end

  def create
    @room = Room.find(params[:room_id])
      if user_signed_in?
        @chat = @room.chats.new(user_chat_params)
      else
        @chat = @room.chats.new(group_chat_params)
      end
      # binding.pry
        if @chat.save
          ActionCable.server.broadcast 'chat_channel', content: @chat
        else
          @chats = @room.chats.includes(:user, :conservation_group)
          render :index
        end
  end

  private

  def user_chat_params
    params.require(:chat).permit(:content).merge(user_id: current_user.id, conservation_group_id: nil)
  end

  def group_chat_params
    params.require(:chat).permit(:content).merge(user_id: nil, conservation_group_id: current_conservation_group.id)
  end

end
