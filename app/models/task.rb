class Task < ApplicationRecord
  belongs_to :task_list
  belongs_to :fulfiller, polymorphic: true
end
