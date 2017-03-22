require "#{Rails.root}/app/models/user"
require "#{Rails.root}/app/models/history"
require "chatwork"

module Tasks
end

class Tasks::Chatworknote
  def self.decide_message
    s=Date.today.wday
    case s
    when 1,4
      "燃えるごみを捨ててください"
    when 2
      "資源ごみを捨ててください"
    else
      h=History.last
      h.user.name
      #{}"何も捨てなくていいです"
    end
  end

  def self.decide_toids
    h=History.last
    h.user.chatworkid
  end

  def self.notify
    message=decide_message
    toids=decide_toids
    roomid=Settings.chatwork.rid
    ChatWork.api_key = Settings.chatwork.api_token
    ChatWork::Task.create(room_id:roomid,body: message,to_ids:toids)
  end

end

#builder=Chatworknote.new
#builder.notify
