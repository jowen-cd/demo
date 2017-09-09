class FriendshipSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :friend_id, :unread_sms_count
end
