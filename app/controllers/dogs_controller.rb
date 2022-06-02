class DogsController < ApplicationController
  def index
    if params[:query].present?
      @dogs = Dog.search_by_breed_and_location(params[:query])
    else
      @dogs = Dog.all
    end
      @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user
    if @dog.save!
      redirect_to dog_path(@dog)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @dog = Dog.find(params[:id])
    @booking = Booking.new
  end

  def destroy
    @dog = Dog.find(params[:id])
    @dog.destroy
    redirect_to dogs_path, status: :see_other
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :age, :sex, :location, photos: [])
  end
end
