require 'test_helper'

class InvitationTest < ActiveSupport::TestCase
  setup do
    @sender = User.create(email: 'sender@example.com', password: 'password')
    @recipient = User.create(email: 'recipient@example.com', password: 'password')

    @invitation = Invitation.create(sender: @sender)
  end

  test 'On accepting, a recipient becomes an available assignee' do
    @invitation.accept(@recipient)

    assert_equal @recipient, @sender.available_assignees.first
  end

  test 'A user can have sent invitations' do
    assert_equal 1, @sender.sent_invitations.size
  end

  test 'A user can have received invitations' do
    @invitation.accept(@recipient)

    assert_equal 1, @recipient.received_invitations.size
  end

  test 'A user is recorded as the recipient on accepting an invitation' do
    @invitation.accept(@recipient)

    assert_equal @recipient, @invitation.recipient
  end

  test 'The sender becomes the recipient’s task setter' do
    @invitation.accept(@recipient)

    assert_equal @recipient.task_setters.first, @sender
  end
end
