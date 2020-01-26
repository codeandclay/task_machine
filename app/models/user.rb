class User < ApplicationRecord
  include Clearance::User

  has_many :task_lists, class_name: 'TaskList', foreign_key: 'creator_id'
  has_many :fulfilled_tasks, class_name: 'Task', foreign_key: 'fulfiller_id'
end
