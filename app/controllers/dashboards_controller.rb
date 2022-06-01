class DashboardsController < ApplicationController
  def index
    @dogs = current_user.dogs
  end
end
