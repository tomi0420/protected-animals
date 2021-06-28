class AnimalsController < ApplicationController
  before_action :set_animal, only: :show
  before_action :search_animal, only: [:index, :complex_search]

  def index
    @animals = Animal.includes(:conservation_group, :tags, :likes).with_attached_images.order('created_at DESC')
  end

  def new
    @new_animal = NewAnimal.new
  end

  def create
    @new_animal = NewAnimal.new(new_animal_params)
    tag_list = params[:new_animal][:kind_name]
    if @new_animal.valid?
       @new_animal.save(tag_list)
       redirect_to root_path
    else
       render :new
    end
  end

  def show
  end

  # def search
  #   return nil if params[:keyword] == ""
  #   # tags = []
  #   # params["keyword"].split('、').each do |k|
  #   #   tags.push(Tag.where(['kind_name LIKE ?', "%#{k}%"] ))  
  #   # end
  #   tag = Tag.where(['kind_name LIKE ?', "%#{params[:keyword]}%"] )
  #   render json:{ keyword: tag }
  # end

  def complex_search
    @animals = @q.result.order('created_at DESC')
    render :index
  end

  private

  def new_animal_params
    params.require(:new_animal).permit( :name, :animal_category_id, :size_id, :sex_id, :age, :birth_date, :personality, :prefecture_id, images: [], kind_name: [] ).merge( conservation_group_id: current_conservation_group.id )
  end

  def set_animal
    @animal = Animal.find(params[:id])
  end

  def search_animal
    @q = Animal.ransack(params[:q])
  end

end
