require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  setup do
    @user = User.create(email: 'test_user@example.com', password: 'password')
    @task_list = @user.task_lists.create(title: 'Test List')
    @task = @task_list.tasks.create(title: 'Test Task')
  end

  test 'a test can be fulfilled by somebody' do
    @task.fulfiller = @user

    assert @task.fulfiller_id == @user.id
  end

  test 'a user can have fulfilled tasks' do
    @task.update(fulfiller: @user)

    assert @user.fulfilled_tasks.size == 1
  end
end
