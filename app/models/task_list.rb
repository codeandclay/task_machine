class TaskList < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

  has_many :tasks

  has_many :assignees_task_lists, foreign_key: 'task_list_id'
  has_many :assignees, through: :assignees_task_lists
end

