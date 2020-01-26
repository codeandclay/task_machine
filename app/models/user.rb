class User < ApplicationRecord
  include Clearance::User

  has_many :task_lists, class_name: 'TaskList', foreign_key: 'creator_id'
  has_many :fulfilled_tasks, class_name: 'Task', foreign_key: 'fulfiller_id'

  has_many :assignees_task_lists, foreign_key: 'assignee_id'
  has_many :assigned_task_lists, through: :assignees_task_lists, source: :task_list
end
