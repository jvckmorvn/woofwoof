class DogsController < ApplicationController
  before_action :set_dog, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      @dogs = Dog.search_by_breed_and_location(params[:query])
    else
      @dogs = Dog.all
    end
    @dog = Dog.new
    @markers = @dogs.geocoded.map do |dog|
      {
        lat: dog.latitude,
        lng: dog.longitude,
        info_window: render_to_string(partial: "info_window", locals: { dog: dog })
      }
    end
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
    @booking = Booking.new
  end

  def edit
  end

  def update
    if @dog.update(dog_params)
      redirect_to dog_path(@dog)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @dog.destroy
    redirect_to dogs_path, status: :see_other
  end

  private

  def set_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :breed, :age, :sex, :location, :description, photos: [])
  end
end
