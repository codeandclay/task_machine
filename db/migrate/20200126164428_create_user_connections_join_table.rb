class CreateUserConnectionsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :setters,
                      :available_assignees,
                      table_name: :user_connections,
                      column_options: { type: :uuid } do |t|
      t.index :setter_id
      t.index :available_assignee_id
    end
  end
end
