class User < ApplicationRecord
  include Clearance::User

  has_many :task_lists, as: :creator
  has_many :fulfilled_tasks, as: :fulfiller, class_name: 'Task'
end
