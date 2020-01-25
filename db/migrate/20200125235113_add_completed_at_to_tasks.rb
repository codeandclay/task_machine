class AddCompletedAtToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :completed_at, :datetime, precision: 6
  end
end
