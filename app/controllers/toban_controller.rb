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

    builder=Builder::Tobanbuilder.new
    next_history=builder.next_gomitoban(history.user_id,users.ids)
    if next_history.save
      redirect_to "/toban",notice:'とばしました!'
    else
      redirect_to "/toban",alert:'失敗しました'
    end
  end

end
