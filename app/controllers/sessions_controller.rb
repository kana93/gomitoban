class SessionsController < ApplicationController
  def new
  end

  def create
    user=User.find_by(login_id: params[:session][:login_id])
    if user && user.authenticate(params[:session][:password])
      log_in user
      if user.superuser
        #superuserがtrueならスーパーユーザーとしてユーザー画面にログイン
        redirect_to "/users",notice:'ユーザー画面です'
      else
        redirect_to "/toban",alert:'スーパーユーザーではありません'
      end

    else
      redirect_to "/login",alert: 'chatworkidまたはpasswordが無効です'
    end
  end

  def destroy
  end
end
