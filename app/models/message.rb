class Message < ApplicationRecord
  belongs_to :user
  belongs_to :another, class_name: 'User'
end
