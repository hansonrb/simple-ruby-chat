class Chat < ApplicationRecord
  validates_presence_of :chat
  validates_presence_of :sender_id
  validates_presence_of :receiver_id

  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'
end
