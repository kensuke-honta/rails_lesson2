class ProfileController < ApplicationController
  def show
    @user = current_user
    
  end
  
  def edit
    @user = User.find(current_user.id)
  end

  

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      @user.avatar.recreate_versions! if @user.avatar.present?
      redirect_to action: :show
    else
      redirect_to action: :show
    end
  end
  
  private
 
  
  def user_params
    params.require(:user).permit(:avatar, :name, :introduction)
  end
end
