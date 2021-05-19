class AnimalsController < ApplicationController
  before_action :set_animal, only: :show

  def index
    @animals = Animal.order('created_at DESC')                   #保護団体を登録後、N＋１問題を解消
  end

  def new
    @new_animal = NewAnimal.new
  end

  def create
    @new_animal = NewAnimal.new(new_animal_params)
    if @new_animal.valid?
       @new_animal.save
       redirect_to root_path
    else
       render :new
    end
  end

  def show
  end

  private

  def new_animal_params
    params.require(:new_animal).permit( :name, :animal_category_id, :kind_name, :size_id, :sex_id, :age, :birth_date, :personality, :prefecture_id, images: [] )
  end

  def set_animal
    @animal = Animal.find(params[:id])
  end

end
