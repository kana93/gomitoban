class UsersController < ApplicationController
  def edit
    @user =User.find(params[:id])
  end

  def update
    @user =User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user,notice:'更新しました'
    else
      render:edit
    end
  end



  def show
    @users= User.order(:id)
    respond_to do |format|
      format.html
    end
  end

  def user_params
    params.require(:user).permit(
    :name,:password,:chatworkid
    )
  end
end
