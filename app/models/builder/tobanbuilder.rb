#コード単体で動かしてテストするためのclass
#class History
#  attr_accessor :user_id,:gomidasibi
#  def initialize
#  end
#end

module Builder
end

class Builder::Tobanbuilder
  # ここから下は新しい実装
  # 新しいIDが戻り値
  def next_id(old_id,array)
    if old_id==array.last
      array.first
    else
      n=array.index(old_id)+1
      array[n]
    end
  end
  #新しいごみだし日が戻り値
  def next_gomidasibi
    require "date"
    s=Date.today.wday
    case s
    when 1,2,4
      Date.today
    when 0,3
      Date.today+1
    when 5
      Date.today+3
    when 6
      Date.today+2
    end
  end

  def next_gomitoban(old_id,array)
    history = History.new
    history.user_id = next_id(old_id, array)
    history.gomidasibi=next_gomidasibi
    history
  end
end
#テスト用
builder=Builder::Tobanbuilder.new
builder.next_gomitoban(15,[3,6,12,14,15,70])
