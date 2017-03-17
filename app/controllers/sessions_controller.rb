class SessionsController < ApplicationController
  def new
  end

  def create
    user=User.find_by(login_id: params[:session][:login_id])
    if user && user.authenticate(params[:session][:password])
      log_in user
      #superuserがtrueならスーパーユーザーとしてユーザー画面にログイン
      redirect_to "/toban",notice:'ログインしました'

    else
      redirect_to "/login",alert: 'ログインidまたはpasswordが無効です'
    end
  end

  def destroy
    reset_session
    redirect_to toban_path,notice:'ログアウトしました'
  end
end
