class TobanController < ApplicationController


  def show
    @history= History.last
    respond_to do |format|
      format.html
    end
  end

end
