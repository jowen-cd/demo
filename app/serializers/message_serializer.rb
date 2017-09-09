class MessageSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :another_id, :type, :content, :is_read
end
