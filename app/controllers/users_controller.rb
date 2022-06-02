class UsersController < ApplicationController
  def dashboard
    @dogs = current_user.dogs
    @bookings = current_user.bookings
  end
end
