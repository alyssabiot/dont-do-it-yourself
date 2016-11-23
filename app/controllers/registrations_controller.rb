class RegistrationsController < Devise::RegistrationsController
  before_action :set_user, only: [:edit, :update]

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :address, :photo, :photo_cache)
  end
end
