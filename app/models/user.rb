class User < ApplicationRecord
  include Clearance::User

  has_many :task_lists, class_name: 'TaskList', foreign_key: 'creator_id'
  has_many :fulfilled_tasks, class_name: 'Task', foreign_key: 'fulfiller_id'

  has_many :assignees_task_lists, foreign_key: 'assignee_id'
  has_many :assigned_task_lists, through: :assignees_task_lists, source: :task_list

  # A user can connect with other available as a setter of tasks
  has_many :setter_connections, class_name: 'UserConnection', foreign_key: 'setter_id'
  has_many :available_assignees, through: :setter_connections

  # A user can connect with task setters as an availabale assignee
  has_many :assignee_connections, class_name: 'UserConnection', foreign_key: 'available_assignee_id'
  has_many :task_setters, through: :assignee_connections, source: :setter

  # A setter can invite users to become assignees
  has_many :sent_invitations, class_name:  'Invitation', foreign_key: 'sender_id'
  has_many :received_invitations, class_name:  'Invitation', foreign_key: 'recipient_id'

  # Users can send eachother messages
  has_many :sent_messages, class_name: 'DirectMessage', foreign_key: 'sender_id'
  has_many :received_messages, class_name: 'DirectMessage', foreign_key: 'recipient_id'

  def connect_with_assignee(assignee)
    available_assignees << assignee
  end

  def connect_with_setter(setter)
    task_setters << setter
  end
end
