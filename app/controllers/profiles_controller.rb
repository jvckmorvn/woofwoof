class ProfilesController < ApplicationController
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Your profile has been deleted!"
    redirect_to dashboard_path, status: :see_other
  end
end
