class TaskList < ApplicationRecord
  belongs_to :creator, polymorphic: true
end
