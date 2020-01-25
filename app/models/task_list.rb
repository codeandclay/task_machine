class TaskList < ApplicationRecord
  belongs_to :creator, polymorphic: true

  has_many :tasks
end
