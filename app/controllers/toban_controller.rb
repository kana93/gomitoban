class TobanController < ApplicationController


  def show
    @history= History.last
    respond_to do |format|
      format.html
    end
  end

  def create
    users=User.order(:id)
    history=History.last

    next_history=Builder::Tobanbuilder.new
    @next_history=next_history.next_gomitoban(history.user_id,users.ids)
    @next_history.save

    redirect_to "/toban",notice:'とばしました!'
  end

end
