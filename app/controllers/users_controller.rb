class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    
    def show
      @user = current_user
      @avatar_url = @user.avatar.url if @user.avatar?
    end
  end
  
  def profile_params
    params.require(:user).permit(:email, :last_name, :first_name, :avatar)
  end
end
