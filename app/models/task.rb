class Task < ApplicationRecord
  belongs_to :task_list
  belongs_to :fulfiller, polymorphic: true

  def complete?
    fulfiller.present?
  end
end
