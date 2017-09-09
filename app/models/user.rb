class User < ApplicationRecord
  has_many :friendships
  has_many :friends, through: :friendships

  has_many :messages
  has_many :send_messages
  has_many :receive_messages

  def friend_request(friend)
    friendship = self.friendships.where(friend_id: friend.id).first
    return friendship if friendship.present?
    transaction do
      friendship = Friendship.where(user: self, friend: friend).create
      Friendship.where(user: friend, friend: self).create
    end
    friendship
  end

  def messages_with(another)
    messages.where(another: another)
  end

end
