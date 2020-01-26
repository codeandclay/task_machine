class Invitation < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :recipient, class_name: 'User', foreign_key: 'recipient_id', optional: true

  def accept(recipient)
    update(
      recipient_id: recipient.id,
      date_accepted: DateTime.current,
    )

    sender.connect_with_assignee(recipient)
  end
end
