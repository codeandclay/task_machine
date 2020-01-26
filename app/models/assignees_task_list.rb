class AssigneesTaskList < ApplicationRecord
  belongs_to :assignee, class_name: 'User'
  belongs_to :task_list
end
