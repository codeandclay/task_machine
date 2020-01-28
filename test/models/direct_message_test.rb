require 'test_helper'

class DirectMesssageTest < ActiveSupport::TestCase
  setup do
    @sender = User.create(email: 'sender@example.com', password: 'password')
    @recipient = User.create(email: 'recipient@example.com', password: 'password')
    @body = 'Example message.'
  end

  test 'A user can have sent messages' do
    DirectMessage.send_message(sender: @sender, recipient: @recipient, body: @body)

    assert_equal 1, @sender.sent_messages.size
  end

  test 'A user can have received messages' do
    DirectMessage.send_message(sender: @sender, recipient: @recipient, body: @body)

    assert_equal 1, @recipient.received_messages.size
  end

  test 'The time of when the recipient reads the message is recorded' do
    # I could override the body accessor, check whether the current user is
    # the recipient. If so, I can record the date.
    skip
  end
end
