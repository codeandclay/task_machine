class CreateDirectMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :direct_messages, id: :uuid do |t|
      t.timestamps null: false
      t.belongs_to :sender, null: false, type: :uuid
      t.belongs_to :recipient, null: false, type: :uuid
      t.datetime :read_at
      t.text :body, null: false
    end
  end
end
