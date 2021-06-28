class UsersController < ApplicationController
  before_action :set_user

  def index
    likes = @user.likes
    @animals = []
    likes.each do |like|
      animal = Animal.find(like.animal_id)
      @animals << animal
    end
  end

  def show
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
  
end
