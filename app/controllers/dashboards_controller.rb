class DashboardsController < ApplicationController
  def index
    @dogs = current_user.dogs
    @bookings = current_user.bookings
  end
end
