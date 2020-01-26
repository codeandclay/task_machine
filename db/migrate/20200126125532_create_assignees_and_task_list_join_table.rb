class CreateAssigneesAndTaskListJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :assignees,
                      :task_lists,
                      table_name: :assignees_task_lists,
                      column_options: {type: :uuid} do |t|
      t.index :task_list_id
      t.index :assignee_id
    end
  end
end
