class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @booking.dog = Dog.find(params[:dog_id])
    @booking.user = current_user
    if @booking.save
      redirect_to dog_path(@booking.dog), notice: "Booking successful!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dog_path(@booking.dog), status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
