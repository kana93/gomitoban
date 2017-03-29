require "chatwork"
module Tasks
end

class Tasks::CreateUserDatas
  def self.execute
    ChatWork.api_key = Settings.chatwork.api_token
    r = ChatWork::Room.get&.detect {|r| r['name'] == Settings.chatwork.room_name }
    ChatWork::Member.get(room_id: r['room_id']).each_with_index do |m,i|
      User.create!(name: m['name'],chatworkid: m['account_id'],login_id:"login#{i+1}",password:'password',superuser: true)
    end
    History.create!(user_id: User.first.id ,gomidasibi: Time.now)
  end
end
