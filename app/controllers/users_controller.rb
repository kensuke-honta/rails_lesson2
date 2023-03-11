class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    
  end
  def profile_params
    params.require(:user).permit(:email, :last_name, :first_name, :avatar)
  end
end
