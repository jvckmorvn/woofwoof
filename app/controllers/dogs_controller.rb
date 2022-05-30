class DogsController < ApplicationController

  def index
    @dogs = Dog.all
  end
  
  def create
    @dog = Dog.new(dog_params)
    if @dog.save
      redirect_to dog_path(@dog)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :age, :sex, :location, :photos)
  end
end
