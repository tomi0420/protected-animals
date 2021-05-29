class AnimalsController < ApplicationController
  before_action :set_animal, only: :show
  before_action :search_animal, only: [:index, :complex_search]

  def index
    @animals = Animal.order('created_at DESC')                   #保護団体を登録後、N＋１問題を解消
    set_animal_column       # privateメソッド内で定義
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

  def search
    return nil if params[:keyword] == ""
    tag = Tag.where(['kind_name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: tag }
  end

  def complex_search
    @results = @q.result
  end

  private

  def new_animal_params
    params.require(:new_animal).permit( :name, :animal_category_id, :kind_name, :size_id, :sex_id, :age, :birth_date, :personality, :prefecture_id, images: [] )
  end

  def set_animal
    @animal = Animal.find(params[:id])
  end

  def search_animal
    @q = Animal.ransack(params[:q])
  end

  def set_animal_column
    @animal_sex = Animal.select("sex_id").distinct  # 重複なくnameカラムのデータを取り出す
  end

end
