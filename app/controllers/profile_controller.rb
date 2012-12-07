class ProfileController < ApplicationController
  def edit
    @profile = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to dashboard_path, notice: "Successfully updated profile"
    else
      render :edit, alert: "Errors made it impossible to proceed"
    end
  end
end
