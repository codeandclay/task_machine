require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user_a = User.create(email: 'test_user_a@example.com', password: 'password')
    @user_b = User.create(email: 'test_user_b@example.com', password: 'password')
    @user_c = User.create(email: 'test_user_c@example.com', password: 'password')
  end

  test 'a user can be connected with an available assignee' do
    @user_a.connect_with_assignee @user_b

    assert @user_a.available_assignees.first == @user_b
  end

  test 'a user can be connected with multiple available assignees' do
    @user_a.connect_with_assignee @user_b
    @user_a.connect_with_assignee @user_c

    assert @user_a.available_assignees.size == 2
  end

  test 'a user can be connected with a setter' do
    @user_b.connect_with_setter @user_a

    assert @user_b.task_setters.first == @user_a
  end

  test 'a user can be connected with multiple setters' do
    @user_c.connect_with_setter @user_a
    @user_c.connect_with_setter @user_b

    assert @user_c.task_setters.size == 2
  end
end
