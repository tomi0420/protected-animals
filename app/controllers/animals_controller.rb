class AnimalsController < ApplicationController

  def new
    @new_animal = NewAnimal.new
  end
  
end
