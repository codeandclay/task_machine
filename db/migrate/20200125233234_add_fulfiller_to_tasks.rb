class AddFulfillerToTasks < ActiveRecord::Migration[6.0]
  def change
    add_reference :tasks, :fulfiller, type: :uuid, polymorphic: true
  end
end
