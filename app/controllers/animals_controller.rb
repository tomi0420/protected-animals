class AnimalsController < ApplicationController

  def new
    @new_animal = NewAnimal.new
  end

  def create
    @new_animal = NewAnimal.new(new_animal_params)
    if @new_animal.valid?
       @new_animal.save
    else
       render :new
    end
  end

  private

  def new_animal_params
    params.require(:new_animal).permit(:name, :animal_category_id, :kind_name, :size_id, :sex_id, :age, :birth_date, :info, :personality, :prefecture_id )
  end

end
