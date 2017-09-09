class ReceiveMessage < Message
  belongs_to :sender, class_name: 'User', foreign_key: :another_id

  def read!
    transaction do 
      self.update_attributes(is_read: true)
      reset_friendship_unread_sms_count
    end
  end

  def reset_friendship_unread_sms_count
    friendship = Friendship.where(user: user, friend: sender).first
    friendship.reset_unread_sms_count
  end

end
