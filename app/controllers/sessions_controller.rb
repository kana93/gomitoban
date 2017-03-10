class SessionsController < ApplicationController
  def new
  end

  def create
    user=User.find_by(chatworkid: params[:session][:chatworkid])
    if user && user.authenticate(params[:session][:password])
      log_in user
      if user.superuser
        #superuserがtrueならスーパーユーザーとしてユーザー画面にログイン
        redirect_to "/users",notice:'ユーザー画面です'
      else
        redirect_to "/toban",notice:'スーパーユーザーではありません'
      end

    else
      flash.now[:danger] = 'Invalid id/password combination'
      render 'new'
    end
  end

  def destroy
  end
end
