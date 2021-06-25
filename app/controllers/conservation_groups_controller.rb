class ConservationGroupsController < ApplicationController

  def show
    @conservation_group = ConservationGroup.find(params[:id])
  end

end
