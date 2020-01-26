class CreateTaskLists < ActiveRecord::Migration[6.0]
  def change
    create_table :task_lists, id: :uuid do |t|
      t.timestamps null: false
      t.string :title, null: false
      t.text :notes, default: ''
      t.belongs_to :creator, type: :uuid
    end
  end
end
