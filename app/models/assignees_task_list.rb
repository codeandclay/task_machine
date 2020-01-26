class AssigneesTaskList < ApplicationRecord
  belongs_to :assignee, class_name: 'User', foreign_key: 'assignee_id'
  belongs_to :task_list
end
