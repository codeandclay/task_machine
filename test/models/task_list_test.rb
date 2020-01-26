require 'test_helper'
 
class TaskListTest < ActiveSupport::TestCase
  setup do
    @user = User.create(email: 'test_user@example.com', password: 'password')
    @assignee_users = (0..10).map do |i|
      User.create(email: "test_user_#{i}@example.com", password: 'password')
    end
    @task_list = @user.task_lists.create(title: 'Test List')
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

  test 'a task list can have many tasks' do
    original_task_count = @task_list.tasks.size
    new_task_count = 5

    new_task_count.times do |i|
      @task_list.tasks.create(title: "Test Task #{i}")
    end

    assert @task_list.tasks.size == original_task_count + new_task_count
  end

  test 'a task has a list' do
    task = @task_list.tasks.create(title: 'Test Task')

    assert task.task_list_id == @task_list.id
  end

  test 'a task list can have an assignee' do
    @task_list.assignees << @user

    assert @task_list.assignees.first.id == @user.id
  end

  test 'a user has assigned task lists' do
    @task_list.assignees << @user

    assert @user.assigned_task_lists.first.id == @task_list.id
  end

  test 'a task list has many assignees' do
    @assignee_users.each do |user|
      @task_list.assignees << user
    end

    assert @task_list.assignees.size == @assignee_users.size
  end
end
