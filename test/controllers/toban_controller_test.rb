require 'test_helper'

class TobanControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  def show
    @history= History.last
    respond_to do |format|
      format.html
    end
  end
  
end
