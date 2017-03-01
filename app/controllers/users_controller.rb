class UsersController < ApplicationController
  def show
    @users= User.order(:id)
    respond_to do |format|
      format.html
    end
  end
end
