class UserConnection < ApplicationRecord
  belongs_to :setter, class_name: 'User', foreign_key: 'setter_id'
  belongs_to :available_assignee, class_name: 'User', foreign_key: 'available_assignee_id'
end
