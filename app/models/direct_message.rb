class DirectMessage < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :recipient, class_name: 'User', foreign_key: 'recipient_id'

  singleton_class.send(:alias_method, :send_message, :create)
end
