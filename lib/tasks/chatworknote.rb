class Builder::Chatworknote
  def decide_message
    s=Date.today.wday
    case s
    when 1,4
      "燃えるごみを捨ててください"
    when 2
      "資源ごみを捨ててください"
    end
  end

  def decide_toids
    h=History.last
    h.user.chatworkid
  end

  def notify
    require "chatwork"
    message=decide_message
    toids=decide_toids
    ChatWork.api_key = 
    ChatWork::Task.create(room_id: "",body: message,to_ids:toids)
  end

end

builder=Builder::Chatworknote.new
builder.notify
