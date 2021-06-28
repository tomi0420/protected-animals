class ConservationGroupsController < ApplicationController
  before_action :set_conservation_group

  def index
    @animals = Animal.where(conservation_group_id: params[:id])
  end

  def show
  end

  private

  def set_conservation_group
    @conservation_group = ConservationGroup.find(params[:id])
  end

end
