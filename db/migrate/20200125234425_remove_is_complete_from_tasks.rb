class RemoveIsCompleteFromTasks < ActiveRecord::Migration[6.0]
  def change
    remove_column :tasks, :is_complete
  end
end
