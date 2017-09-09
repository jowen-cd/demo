class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"


  def reset_unread_sms_count
    self.unread_sms_count = ReceiveMessage.where(user: user, sender: friend, is_read: false).count
    self.save
  end
end
