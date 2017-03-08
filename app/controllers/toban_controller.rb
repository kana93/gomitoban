class TobanController < ApplicationController


  def show
    @user= User.last
    respond_to do |format|
      format.html
    end
  end

end
