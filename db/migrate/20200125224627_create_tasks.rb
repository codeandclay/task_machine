class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks, id: :uuid do |t|
      t.timestamps null: false
      t.string :title, null: false
      t.text :notes, default: ''
      t.boolean :is_complete, default: false
      t.belongs_to :task_list, type: :uuid
    end
  end
end
