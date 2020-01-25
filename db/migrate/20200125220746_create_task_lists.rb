class CreateTaskLists < ActiveRecord::Migration[6.0]
  def change
    create_table :task_lists, id: :uuid do |t|
      t.timestamps null: false
      t.string :title, null: false, index: true
      t.text :notes, default: ''
      t.belongs_to :creator, type: :uuid, polymorphic: true
    end
  end
end
