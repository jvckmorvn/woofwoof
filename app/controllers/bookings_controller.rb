class BookingsController < ApplicationController
  def new
    @dog = Dog.find(params[:dog_id])
    @booking = @dog.bookings.new
    @booking.user = current_user
  end

  def create
    @dog = Dog.find(params[:dog_id])
    @booking = @dog.bookings.new(booking_params)
    @booking.user = current_user
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dog_path(@booking.dog), status: :see_other
  end

  private

  def booking_params
      params.require(:booking).permit(:dog_id, :start_date, :end_date)
  end
end
