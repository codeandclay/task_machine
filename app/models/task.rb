class Task < ApplicationRecord
  belongs_to :task_list
  belongs_to :fulfiller, class_name: 'User', foreign_key: 'fulfiller_id'

  def complete?
    fulfiller.present?
  end
end
