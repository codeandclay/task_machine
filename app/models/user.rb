class User < ApplicationRecord
  include Clearance::User

  has_many :task_lists, as: :creator
end
