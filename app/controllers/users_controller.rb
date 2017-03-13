class UsersController < ApplicationController
  def edit
    @user =User.find(params[:id])
  end

  def update
    @user =User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path,notice:'更新しました'
    else
      redirect_to edit_user_path,alert:'更新に失敗しました'
    end
  end

  def new
    @user = User.create
  end


  def create
    @user =User.new(user_params)
    if @user.save
      redirect_to "/users",notice:'作成しました'
    else
      redirect_to new_user_path,alert:'新規作成に失敗しました'
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
    :name,:password,:chatworkid,:password_confirmation,:superuser
    )
  end

  def destroy
    @user=User.find(params[:id])
    @user.destroy!
    redirect_to user_path,notice:'削除しました'
  end
end
