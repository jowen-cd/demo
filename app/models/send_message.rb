class SendMessage < Message
  belongs_to :receiver, class_name: 'User', foreign_key: :another_id

  after_commit :create_receive_message, on: :create

  private
  def create_receive_message
    ## TODO create by sidekiq
    message = ReceiveMessage.create(user: receiver, sender: user, content: content)
    message.reset_friendship_unread_sms_count
  end
end
