module Client
  class Contact < Base
    self.element_name = "friendships"
    
    def sms_history
      Client::Sms.where(user_id: self.user_id, friend_id: friend_id)
    end

    def send_history
      sms_history.select{|sms| sms.type == "SendMessage"}
    end

    def receive_history
      sms_history.select{|sms| sms.type != "SendMessage"}
    end

    def send_sms(content)
      sms = Client::Sms.new(user_id: self.user_id, friend_id: friend_id, content: content)
      sms.save
    end

  end
end
