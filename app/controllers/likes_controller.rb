class LikesController < ApplicationController
  before_action :animal_params

  def create
    Like.create(user_id: current_user.id, animal_id: params[:id])
  end

  def destroy
    Like.find_by(user_id: current_user.id, animal_id: params[:id]).destroy
  end

  private

  def animal_params
    @animal = Animal.find(params[:id])
  end

end
