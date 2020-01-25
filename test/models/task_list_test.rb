require 'test_helper'
 
class TaskListTest < ActiveSupport::TestCase
  setup do
    @user = User.create(email: 'test_user@example.com', password: 'password')
  end

  test 'a user can create a task list' do
    original_list_count = @user.task_lists.size

    @user.task_lists.create(title: 'Test List')
    assert @user.task_lists.size == original_list_count + 1
  end

  test 'a user can create many task lists' do
    original_list_count = @user.task_lists.size
    new_task_list_count = 5

    new_task_list_count.times do |i|
      @user.task_lists.create(title: "Test List #{i}")
    end

    assert @user.task_lists.size == original_list_count + new_task_list_count
  end

  test 'a task list has a creator' do
    @user.task_lists.create(title: 'Test List')

    assert TaskList.first.creator_id == @user.id
  end
end
