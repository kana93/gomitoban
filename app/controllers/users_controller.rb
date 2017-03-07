class UsersController < ApplicationController
  def edit
    @user =User.find(params[:id])
  end

  def update
    @user =User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path,notice:'更新しました'
    else
      render:edit
    end
  end

  def new
    @user = User.create
  end


    def create
      @user =User.create
      if @user.save(user_params)
      else
        render :new
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

  def destroy
    @user=User.find(params[:id])
    @user.destroy!
    redirect_to user_path,notice:'削除しました'
  end
end
