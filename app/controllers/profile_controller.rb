class ProfileController < ApplicationController
  def show
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:avatar, :name, :introduction))
      flash[:notice] = "ユーザーIDが「#{@user.id}」の情報を更新しました"
      redirect_to :users
    else
      render "edit"
    end
  end

  def edit
  end
end
