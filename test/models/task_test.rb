require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  setup do
    @user = User.create(email: 'test_user@example.com', password: 'password')
    @task_list = @user.task_lists.create(title: 'Test List')
    @task = @task_list.tasks.create(title: 'Test Task')
  end

  test 'a test can be fulfilled by somebody' do
    @task.fulfiller = @user

    assert_equal @user.id, @task.fulfiller_id
  end

  test 'a user can have fulfilled tasks' do
    @task.update(fulfiller: @user)

    assert_equal 1, @user.fulfilled_tasks.size
  end
end
