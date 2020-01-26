class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations, id: :uuid do |t|
      t.timestamps null: false
      t.references :sender, type: :uuid, null: false
      t.references :recipient, type: :uuid
      t.datetime :date_sent
      t.datetime :date_accepted
      t.string :delivery_method
    end
  end
end
